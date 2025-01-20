@interface _SYLazyChangeArray
- (_SYLazyChangeArray)initWithSYObjectDataArray:(id)a3 typeArray:(id)a4 decoder:(id)a5;
- (_SYLazyChangeArray)initWithSourceArray:(id)a3 decoder:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (int64_t)compatibilityVersion;
- (unint64_t)count;
- (void)setCompatibilityVersion:(int64_t)a3;
@end

@implementation _SYLazyChangeArray

- (_SYLazyChangeArray)initWithSourceArray:(id)a3 decoder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  v10 = 0;
  if (v8 && v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SYLazyChangeArray;
    v11 = [(_SYLazyChangeArray *)&v13 init];
    self = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_source, a3);
      objc_storeStrong((id *)&self->_decoder, a4);
      self->_compatibilityVersion = 2;
      self = self;
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (_SYLazyChangeArray)initWithSYObjectDataArray:(id)a3 typeArray:(id)a4 decoder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 count];
  objc_super v13 = 0;
  if (v11 && v12)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
    {
      v16.receiver = self;
      v16.super_class = (Class)_SYLazyChangeArray;
      v14 = [(_SYLazyChangeArray *)&v16 init];
      self = v14;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_source, a3);
        objc_storeStrong((id *)&self->_types, a4);
        objc_storeStrong((id *)&self->_decoder, a5);
        self->_isSYObjectDataArray = 1;
        self->_compatibilityVersion = 1;
        self = self;
        objc_super v13 = self;
        goto LABEL_9;
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"SYChangeSerializer %@ needs to implement SYObjectWithData: to communicate with devices running WatchOS 1.x", v11 format];
    }
    objc_super v13 = 0;
  }
LABEL_9:

  return v13;
}

- (unint64_t)count
{
  return [(NSArray *)self->_source count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_isSYObjectDataArray)
  {
    char v5 = objc_opt_respondsToSelector();
    decoder = self->_decoder;
    id v7 = [(NSArray *)self->_source objectAtIndexedSubscript:a3];
    if (v5)
    {
      id v8 = [(NSArray *)self->_types objectAtIndexedSubscript:a3];
      id v9 = -[SYChangeSerializer decodeChangeData:fromProtocolVersion:ofType:](decoder, "decodeChangeData:fromProtocolVersion:ofType:", v7, 1, [v8 integerValue]);

      goto LABEL_10;
    }
    uint64_t v13 = [(SYChangeSerializer *)decoder SYObjectWithData:v7];
  }
  else
  {
    int64_t compatibilityVersion = self->_compatibilityVersion;
    id v11 = [(NSArray *)self->_source objectAtIndexedSubscript:a3];
    id v7 = v11;
    uint64_t v12 = self->_decoder;
    if (compatibilityVersion > 1) {
      [v11 changeObjectWithSerializer:v12];
    }
    else {
    uint64_t v13 = [v11 changeObjectWithSerializer:v12 encodedByVersion:self->_compatibilityVersion];
    }
  }
  id v9 = (void *)v13;
LABEL_10:

  if (!v9)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v14 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT)) {
      -[_SYLazyChangeArray objectAtIndex:](v14);
    }
    id v9 = +[SYDegenerateChange degenerateChange];
  }
  return v9;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_int64_t compatibilityVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)objectAtIndex:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21C7C9000, log, OS_LOG_TYPE_FAULT, "** COMPANIONSYNC CLIENT BUG ** Deserialization attempt gave us a nil", v1, 2u);
}

@end