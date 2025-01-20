@interface _DNDSSyncMessageGroup
- (BOOL)isEqual:(id)a3;
- (DNDSMutableModeAssertionStore)store;
- (_DNDSSyncMessageGroup)initWithServiceType:(unint64_t)a3 protocolVersion:(unint64_t)a4 store:(id)a5;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (unint64_t)serviceType;
@end

@implementation _DNDSSyncMessageGroup

- (_DNDSSyncMessageGroup)initWithServiceType:(unint64_t)a3 protocolVersion:(unint64_t)a4 store:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_DNDSSyncMessageGroup;
  v9 = [(_DNDSSyncMessageGroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_protocolVersion = a4;
    v9->_serviceType = a3;
    uint64_t v11 = [v8 copy];
    store = v10->_store;
    v10->_store = (DNDSMutableModeAssertionStore *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = (_DNDSSyncMessageGroup *)a3;
  if (self == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      v10 = [(_DNDSSyncMessageGroup *)self store];
      uint64_t v11 = [(_DNDSSyncMessageGroup *)v9 store];
      if (v10 == v11) {
        goto LABEL_10;
      }
      uint64_t v12 = [(_DNDSSyncMessageGroup *)self store];
      if (!v12)
      {
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v3 = (void *)v12;
      uint64_t v13 = [(_DNDSSyncMessageGroup *)v9 store];
      if (!v13)
      {
        BOOL v14 = 0;
        goto LABEL_17;
      }
      v4 = (void *)v13;
      v5 = [(_DNDSSyncMessageGroup *)self store];
      v6 = [(_DNDSSyncMessageGroup *)v9 store];
      if ([v5 isEqual:v6])
      {
LABEL_10:
        unint64_t v15 = [(_DNDSSyncMessageGroup *)self protocolVersion];
        if (v15 == [(_DNDSSyncMessageGroup *)v9 protocolVersion])
        {
          unint64_t v16 = [(_DNDSSyncMessageGroup *)self serviceType];
          BOOL v14 = v16 == [(_DNDSSyncMessageGroup *)v9 serviceType];
        }
        else
        {
          BOOL v14 = 0;
        }
        if (v10 == v11) {
          goto LABEL_18;
        }
      }
      else
      {
        BOOL v14 = 0;
      }

LABEL_17:
      goto LABEL_18;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(_DNDSSyncMessageGroup *)self store];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(_DNDSSyncMessageGroup *)self protocolVersion];
  unint64_t v6 = v5 ^ [(_DNDSSyncMessageGroup *)self serviceType] ^ v4;

  return v6;
}

- (DNDSMutableModeAssertionStore)store
{
  return self->_store;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
}

@end