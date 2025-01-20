@interface _BMDKEventCodec_DKPREvent
- (id)decodeWithProto:(id)a3;
- (id)decodeWithProtoData:(id)a3;
- (id)encodeAsProto:(id)a3;
@end

@implementation _BMDKEventCodec_DKPREvent

- (id)encodeAsProto:(id)a3
{
  v3 = [a3 dkEvent];
  if (objc_opt_respondsToSelector()) {
    [v3 toPBCodableUseStructuredMetadata:1];
  }
  else {
  v4 = [v3 toPBCodable];
  }

  return v4;
}

- (id)decodeWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    get_DKPREventClass();
    if (objc_opt_isKindOfClass())
    {
      get_DKEventClass_1();
      char v5 = objc_opt_respondsToSelector();
      id DKEventClass_1 = get_DKEventClass_1();
      if (v5) {
        objc_msgSend(DKEventClass_1, "fromPBCodable:skipMetadata:", v4, -[BMDKEventCodec decodeMetadata](self, "decodeMetadata") ^ 1);
      }
      else {
      v9 = [DKEventClass_1 fromPBCodable:v4];
      }
      v8 = [[BMDKEvent alloc] initWithDKEvent:v9];

      goto LABEL_11;
    }
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_BMDKEventCodec_DKPREvent decodeWithProto:](v7);
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)decodeWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    char v5 = (void *)[objc_alloc((Class)get_DKPREventClass()) initWithData:v4];

    v6 = [(_BMDKEventCodec_DKPREvent *)self decodeWithProto:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)decodeWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMDKEvent: tried to initialize with a non-_DKPREvent proto", v1, 2u);
}

@end