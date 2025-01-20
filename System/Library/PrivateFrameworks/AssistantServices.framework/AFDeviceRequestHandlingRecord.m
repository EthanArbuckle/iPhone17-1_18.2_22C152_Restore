@interface AFDeviceRequestHandlingRecord
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFDeviceRequestHandlingRecord)init;
- (AFDeviceRequestHandlingRecord)initWithBuilder:(id)a3;
- (AFDeviceRequestHandlingRecord)initWithCoder:(id)a3;
- (AFDeviceRequestHandlingRecord)initWithDictionaryRepresentation:(id)a3;
- (AFDeviceRequestHandlingRecord)initWithRequestID:(id)a3 deviceRoles:(unint64_t)a4;
- (AFDeviceRequestHandlingRecord)initWithSerializedBackingStore:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)requestID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)deviceRoles;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeviceRequestHandlingRecord

- (void).cxx_destruct
{
}

- (unint64_t)deviceRoles
{
  return self->_deviceRoles;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  v6 = AFDeviceRequestHandlingRolesGetNames(self->_deviceRoles);
  [v4 setObject:v6 forKey:@"deviceRoles"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (AFDeviceRequestHandlingRecord)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"deviceRoles"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = AFDeviceRequestHandlingRolesGetFromNames(v8);
    }
    else {
      uint64_t v9 = 0;
    }

    self = [(AFDeviceRequestHandlingRecord *)self initWithRequestID:v6 deviceRoles:v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  requestID = self->_requestID;
  id v5 = a3;
  [v5 encodeObject:requestID forKey:@"AFDeviceRequestHandlingRecord::requestID"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_deviceRoles];
  [v5 encodeObject:v6 forKey:@"AFDeviceRequestHandlingRecord::deviceRoles"];
}

- (AFDeviceRequestHandlingRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeviceRequestHandlingRecord::requestID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeviceRequestHandlingRecord::deviceRoles"];

  uint64_t v7 = [v6 unsignedIntegerValue];
  v8 = [(AFDeviceRequestHandlingRecord *)self initWithRequestID:v5 deviceRoles:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDeviceRequestHandlingRecord *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t deviceRoles = self->_deviceRoles;
      if (deviceRoles == [(AFDeviceRequestHandlingRecord *)v5 deviceRoles])
      {
        uint64_t v7 = [(AFDeviceRequestHandlingRecord *)v5 requestID];
        requestID = self->_requestID;
        BOOL v9 = requestID == v7 || [(NSString *)requestID isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_deviceRoles];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFDeviceRequestHandlingRecord;
  unint64_t v5 = [(AFDeviceRequestHandlingRecord *)&v11 description];
  requestID = self->_requestID;
  uint64_t v7 = AFDeviceRequestHandlingRolesGetNames(self->_deviceRoles);
  v8 = [v7 componentsJoinedByString:@"|"];
  BOOL v9 = (void *)[v4 initWithFormat:@"%@ {requestID = %@, deviceRoles = %@}", v5, requestID, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(AFDeviceRequestHandlingRecord *)self _descriptionWithIndent:0];
}

- (AFDeviceRequestHandlingRecord)initWithRequestID:(id)a3 deviceRoles:(unint64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__AFDeviceRequestHandlingRecord_initWithRequestID_deviceRoles___block_invoke;
  v10[3] = &unk_1E5926738;
  id v11 = v6;
  unint64_t v12 = a4;
  id v7 = v6;
  v8 = [(AFDeviceRequestHandlingRecord *)self initWithBuilder:v10];

  return v8;
}

void __63__AFDeviceRequestHandlingRecord_initWithRequestID_deviceRoles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setRequestID:v3];
  [v4 setDeviceRoles:*(void *)(a1 + 40)];
}

- (AFDeviceRequestHandlingRecord)init
{
  return [(AFDeviceRequestHandlingRecord *)self initWithBuilder:0];
}

- (AFDeviceRequestHandlingRecord)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFDeviceRequestHandlingRecordMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDeviceRequestHandlingRecord;
  unint64_t v5 = [(AFDeviceRequestHandlingRecord *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFDeviceRequestHandlingRecordMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFDeviceRequestHandlingRecordMutation *)v7 isDirty])
    {
      v8 = [(_AFDeviceRequestHandlingRecordMutation *)v7 getRequestID];
      uint64_t v9 = [v8 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v9;

      v6->_unint64_t deviceRoles = [(_AFDeviceRequestHandlingRecordMutation *)v7 getDeviceRoles];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFDeviceRequestHandlingRecordMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFDeviceRequestHandlingRecordMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFDeviceRequestHandlingRecordMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFDeviceRequestHandlingRecord);
      id v7 = [(_AFDeviceRequestHandlingRecordMutation *)v5 getRequestID];
      uint64_t v8 = [v7 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v8;

      v6->_unint64_t deviceRoles = [(_AFDeviceRequestHandlingRecordMutation *)v5 getDeviceRoles];
    }
    else
    {
      id v6 = (AFDeviceRequestHandlingRecord *)[(AFDeviceRequestHandlingRecord *)self copy];
    }
  }
  else
  {
    id v6 = (AFDeviceRequestHandlingRecord *)[(AFDeviceRequestHandlingRecord *)self copy];
  }

  return v6;
}

- (AFDeviceRequestHandlingRecord)initWithSerializedBackingStore:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFDeviceRequestHandlingRecord *)self initWithDictionaryRepresentation:v4];
    unint64_t v5 = self;
  }
  else
  {
    id v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[AFDeviceRequestHandlingRecord(ContextSnapshot) initWithSerializedBackingStore:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type or is nil: %@", (uint8_t *)&v8, 0x16u);
    }
    unint64_t v5 = 0;
  }

  return v5;
}

@end