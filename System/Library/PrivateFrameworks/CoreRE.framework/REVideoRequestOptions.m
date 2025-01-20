@interface REVideoRequestOptions
+ (BOOL)supportsSecureCoding;
- (OS_xpc_object)receiverEndpoint;
- (REVideoRequestOptions)initWithCoder:(id)a3;
- (REVideoRequestOptions)initWithReceiverEndpoint:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REVideoRequestOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REVideoRequestOptions)initWithReceiverEndpoint:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REVideoRequestOptions;
  v6 = [(REResourceRequestOptions *)&v14 init];
  v7 = v6;
  if (v6
    && (p_receiverEndpoint = &v6->_receiverEndpoint,
        objc_storeStrong((id *)&v6->_receiverEndpoint, a3),
        !*p_receiverEndpoint))
  {
    v11 = *re::assetTypesLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_233120000, v11, OS_LOG_TYPE_FAULT, "Expected a non-nil video receiver endpoint", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (REVideoRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REVideoRequestOptions;
  id v5 = [(REResourceRequestOptions *)&v16 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v12 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_233120000, v12, OS_LOG_TYPE_FAULT, "Expected to decode an REVideoRequestOptions from an NSXPCCoder", v15, 2u);
    }
    goto LABEL_11;
  }
  id v7 = v4;
  uint64_t v8 = [v7 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"receiverEndpoint"];
  receiverEndpoint = v5->_receiverEndpoint;
  v5->_receiverEndpoint = (OS_xpc_object *)v8;

  if (!v5->_receiverEndpoint)
  {
    v13 = *re::assetTypesLogObjects(v10);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_233120000, v13, OS_LOG_TYPE_FAULT, "Failed to decode video receiver endpoint", v15, 2u);
    }

LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v11 = v5;
LABEL_12:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    [v4 encodeXPCObject:self->_receiverEndpoint forKey:@"receiverEndpoint"];
  }
  else
  {
    v6 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_fault_impl(&dword_233120000, v6, OS_LOG_TYPE_FAULT, "Expected to encode an REVideoRequestOptions into an NSXPCCoder", v7, 2u);
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<REVideoRequestOptions: %@>", self->_receiverEndpoint];
}

- (OS_xpc_object)receiverEndpoint
{
  return self->_receiverEndpoint;
}

- (void).cxx_destruct
{
}

@end