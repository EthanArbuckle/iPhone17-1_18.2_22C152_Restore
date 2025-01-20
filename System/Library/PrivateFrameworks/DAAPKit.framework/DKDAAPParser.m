@interface DKDAAPParser
- (BOOL)_callDelegateShouldParseCode:(unsigned int)a3;
- (BOOL)_callDelegateShouldParseCodeAsContainer:(unsigned int)a3;
- (BOOL)isCanceled;
- (DKDAAPParser)initWithData:(id)a3;
- (DKDAAPParser)initWithStream:(id)a3;
- (DKDAAPParserDelegate)delegate;
- (NSInputStream)inputStream;
- (NSMutableArray)containerStack;
- (int64_t)state;
- (void)_callDelegateDidCancel;
- (void)_callDelegateDidEndContainerCode:(unsigned int)a3;
- (void)_callDelegateDidFailWithError:(id)a3;
- (void)_callDelegateDidFinish;
- (void)_callDelegateDidParseDataCode:(unsigned int)a3 bytes:(char *)a4 contentLength:(unsigned int)a5;
- (void)_callDelegateDidStart;
- (void)_callDelegateDidStartContainerCode:(unsigned int)a3 contentLength:(unsigned int)a4;
- (void)_verifyExpectedEOF;
- (void)cancel;
- (void)parse;
- (void)setCanceled:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DKDAAPParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (DKDAAPParser)initWithStream:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"DKDAAPParser.m", 36, @"Invalid parameter not satisfying: %@", @"inputStream" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)DKDAAPParser;
  v7 = [(DKDAAPParser *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_inputStream, a3);
    v8->_state = 0;
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    containerStack = v8->_containerStack;
    v8->_containerStack = (NSMutableArray *)v9;
  }
  return v8;
}

- (void)parse
{
  v37[1] = *MEMORY[0x263EF8340];
  if ([(DKDAAPParser *)self isCanceled])
  {
    self->_int64_t state = 3;
    return;
  }
  if (self->_state)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"DKDAAPParser.m" lineNumber:58 description:@"Cannot parse more than once."];
  }
  [(NSInputStream *)self->_inputStream open];
  self->_int64_t state = 1;
  [(DKDAAPParser *)self _callDelegateDidStart];
  if ([(DKDAAPParser *)self isCanceled])
  {
LABEL_6:
    self->_int64_t state = 3;
    [(DKDAAPParser *)self _callDelegateDidCancel];
    goto LABEL_41;
  }
  while (1)
  {
    unsigned int v33 = 0;
    NSInteger v4 = [(NSInputStream *)self->_inputStream read:&v33 maxLength:4];
    if (v4 != 4)
    {
      if (!v4)
      {
        [(DKDAAPParser *)self _verifyExpectedEOF];
        goto LABEL_41;
      }
      if (v4 != -1)
      {
        self->_int64_t state = 4;
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F07F80];
        v37[0] = @"Failed to read property code from input stream.";
        v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
        v28 = [v26 errorWithDomain:@"DKDAAPParserErrorDomain" code:1 userInfo:v27];
        [(DKDAAPParser *)self _callDelegateDidFailWithError:v28];

        goto LABEL_41;
      }
      goto LABEL_37;
    }
    unsigned int v32 = 0;
    unsigned int v33 = bswap32(v33);
    NSInteger v5 = [(NSInputStream *)self->_inputStream read:&v32 maxLength:4];
    if (v5 != 4) {
      break;
    }
    unsigned int v32 = bswap32(v32);
    id v6 = [(NSMutableArray *)self->_containerStack lastObject];
    objc_msgSend(v6, "setRemaining:", objc_msgSend(v6, "remaining") - 8);
    if ([(DKDAAPParser *)self _callDelegateShouldParseCode:v33])
    {
      if ([(DKDAAPParser *)self _callDelegateShouldParseCodeAsContainer:v33])
      {
        v7 = objc_alloc_init(DKDAAPParserContainer);
        [(DKDAAPParserContainer *)v7 setCode:v33];
        [(DKDAAPParserContainer *)v7 setLength:v32];
        [(DKDAAPParserContainer *)v7 setRemaining:v32];
        [(NSMutableArray *)self->_containerStack addObject:v7];

        [(DKDAAPParser *)self _callDelegateDidStartContainerCode:v33 contentLength:v32];
        id v6 = v7;
        goto LABEL_27;
      }
      if (!v32) {
        goto LABEL_27;
      }
      v8 = (void *)MEMORY[0x2166AC2E0]();
      v15 = [MEMORY[0x263EFF990] dataWithCapacity:v32];
      uint64_t v16 = v32;
      while (1)
      {
        inputStream = self->_inputStream;
        id v12 = v15;
        uint64_t v18 = -[NSInputStream read:maxLength:](inputStream, "read:maxLength:", [v12 bytes] + objc_msgSend(v12, "length"), v16);
        if (!v18) {
          break;
        }
        if (v18 == -1) {
          goto LABEL_25;
        }
        v16 -= v18;
        if (!v16)
        {
          int v19 = [v6 remaining];
          [v6 setRemaining:v19 - v32];
          uint64_t v20 = v33;
          uint64_t v21 = [v12 bytes];
          [(DKDAAPParser *)self _callDelegateDidParseDataCode:v20 bytes:v21 contentLength:v32];
          goto LABEL_26;
        }
      }
    }
    else
    {
      if (!v32) {
        goto LABEL_27;
      }
      v8 = (void *)MEMORY[0x2166AC2E0]();
      uint64_t v9 = [MEMORY[0x263EFF990] dataWithCapacity:v32];
      uint64_t v10 = v32;
      while (1)
      {
        v11 = self->_inputStream;
        id v12 = v9;
        uint64_t v13 = -[NSInputStream read:maxLength:](v11, "read:maxLength:", [v12 bytes] + objc_msgSend(v12, "length"), v10);
        if (!v13) {
          break;
        }
        if (v13 == -1)
        {
LABEL_25:
          self->_int64_t state = 4;
          v22 = [(NSInputStream *)self->_inputStream streamError];
          [(DKDAAPParser *)self _callDelegateDidFailWithError:v22];

          goto LABEL_26;
        }
        v10 -= v13;
        if (!v10)
        {
          int v14 = [v6 remaining];
          [v6 setRemaining:v14 - v32];
          goto LABEL_26;
        }
      }
    }
    [(DKDAAPParser *)self _verifyExpectedEOF];
LABEL_26:
    int64_t state = self->_state;

    if (state != 1) {
      goto LABEL_40;
    }
LABEL_27:
    if (v6)
    {
      do
      {
        if ([v6 remaining]) {
          break;
        }
        [(NSMutableArray *)self->_containerStack removeLastObject];
        -[DKDAAPParser _callDelegateDidEndContainerCode:](self, "_callDelegateDidEndContainerCode:", [v6 code]);
        int v24 = [v6 length];
        v25 = [(NSMutableArray *)self->_containerStack lastObject];

        objc_msgSend(v25, "setRemaining:", objc_msgSend(v25, "remaining") - v24);
        id v6 = v25;
      }
      while (v25);
    }
    if ([(DKDAAPParser *)self isCanceled]) {
      goto LABEL_6;
    }
  }
  if (v5 == -1)
  {
LABEL_37:
    self->_int64_t state = 4;
    id v6 = [(NSInputStream *)self->_inputStream streamError];
    [(DKDAAPParser *)self _callDelegateDidFailWithError:v6];
    goto LABEL_40;
  }
  self->_int64_t state = 4;
  v29 = (void *)MEMORY[0x263F087E8];
  uint64_t v34 = *MEMORY[0x263F07F80];
  v35 = @"Failed to read length from input stream.";
  id v6 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v30 = [v29 errorWithDomain:@"DKDAAPParserErrorDomain" code:1 userInfo:v6];
  [(DKDAAPParser *)self _callDelegateDidFailWithError:v30];

LABEL_40:
LABEL_41:
  if (self->_state == 1) {
    self->_int64_t state = 2;
  }
  [(DKDAAPParser *)self _callDelegateDidFinish];
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (BOOL)_callDelegateShouldParseCodeAsContainer:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  NSInteger v5 = [(DKDAAPParser *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v6 = [v5 parser:self shouldParseCodeAsContainer:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_callDelegateShouldParseCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  NSInteger v5 = [(DKDAAPParser *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v6 = [v5 parser:self shouldParseCode:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (DKDAAPParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DKDAAPParserDelegate *)WeakRetained;
}

- (void)_verifyExpectedEOF
{
  v7[1] = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_containerStack count])
  {
    self->_int64_t state = 4;
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F07F80];
    v7[0] = @"Encountered EOF while reading input stream";
    NSInteger v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    NSInteger v5 = [v3 errorWithDomain:@"DKDAAPParserErrorDomain" code:2 userInfo:v4];
    [(DKDAAPParser *)self _callDelegateDidFailWithError:v5];
  }
}

- (void)_callDelegateDidStart
{
  uint64_t v3 = [(DKDAAPParser *)self delegate];
  if (v3)
  {
    NSInteger v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 parserDidStart:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_callDelegateDidStartContainerCode:(unsigned int)a3 contentLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [(DKDAAPParser *)self delegate];
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      [v8 parser:self didStartContainerCode:v5 contentLength:v4];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_callDelegateDidParseDataCode:(unsigned int)a3 bytes:(char *)a4 contentLength:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = [(DKDAAPParser *)self delegate];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if (objc_opt_respondsToSelector()) {
      [v10 parser:self didParseDataCode:v7 bytes:a4 contentLength:v5];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_callDelegateDidFinish
{
  uint64_t v3 = [(DKDAAPParser *)self delegate];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 parser:self didFinishWithState:self->_state];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_callDelegateDidEndContainerCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(DKDAAPParser *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 parser:self didEndContainerCode:v3];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)setDelegate:(id)a3
{
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_callDelegateDidFailWithError:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(DKDAAPParser *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 parser:self didFailWithError:v5];
  }
}

- (void)_callDelegateDidCancel
{
  uint64_t v3 = [(DKDAAPParser *)self delegate];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 parserDidCancel:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)cancel
{
}

- (DKDAAPParser)initWithData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"DKDAAPParser.m", 46, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x263EFF950] inputStreamWithData:v5];
  uint64_t v7 = [(DKDAAPParser *)self initWithStream:v6];

  return v7;
}

@end