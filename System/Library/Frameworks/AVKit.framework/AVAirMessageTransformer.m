@interface AVAirMessageTransformer
- (AVAirMessageTransformer)initWithMessageClass:(Class)a3;
- (Class)messageClass;
- (id)dataForMessage:(id)a3;
- (id)reverseTransformerForMessageData:(id)a3;
- (void)resetState;
@end

@implementation AVAirMessageTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageClass, 0);

  objc_storeStrong((id *)&self->_previousUnusedData, 0);
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (id)reverseTransformerForMessageData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ([(NSData *)self->_previousUnusedData length])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v4, "length") + -[NSData length](self->_previousUnusedData, "length"));
    [v5 appendData:self->_previousUnusedData];
    if (v4) {
      [v5 appendData:v4];
    }
  }
  if (v5)
  {
    v6 = +[AVMessageParser airMessageParser];
    v7 = [v6 partsWithData:v5];

    if ([v7 isIncomplete])
    {
      v8 = v5;
    }
    else
    {
      v8 = [v7 extraData];
    }
    previousUnusedData = self->_previousUnusedData;
    self->_previousUnusedData = v8;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)dataForMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 messageDataRepresentation];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_11;
      }
      v5 = _avairlog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v9 = 136315394;
        v10 = "-[AVAirMessageTransformer dataForMessage:]";
        __int16 v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s value not represented by NSData (%@)", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      v5 = _avairlog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        v10 = "-[AVAirMessageTransformer dataForMessage:]";
        _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s value does not implement AVMessageTransformerProtocol", (uint8_t *)&v9, 0xCu);
      }
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
LABEL_11:

  return v4;
}

- (void)resetState
{
  self->_previousUnusedData = 0;
  MEMORY[0x1F41817F8]();
}

- (AVAirMessageTransformer)initWithMessageClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAirMessageTransformer;
  id v4 = [(AVAirMessageTransformer *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_messageClass, a3);
  }
  return v5;
}

@end