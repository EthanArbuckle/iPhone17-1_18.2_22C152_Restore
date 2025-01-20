@interface HDFHIRResourceObjectPair
- (HDFHIRResourceObject)providedResource;
- (HDFHIRResourceObjectPair)init;
- (HDFHIRResourceObjectPair)initWithProvidedResource:(id)a3 databaseResource:(id)a4;
- (HDOriginalFHIRResourceObject)databaseResource;
@end

@implementation HDFHIRResourceObjectPair

- (HDFHIRResourceObjectPair)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRResourceObjectPair)initWithProvidedResource:(id)a3 databaseResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDFHIRResourceObjectPair;
  v8 = [(HDFHIRResourceObjectPair *)&v14 init];
  if (v8)
  {
    v9 = (HDFHIRResourceObject *)[v6 copy];
    providedResource = v8->_providedResource;
    v8->_providedResource = v9;

    v11 = (HDOriginalFHIRResourceObject *)[v7 copy];
    databaseResource = v8->_databaseResource;
    v8->_databaseResource = v11;
  }
  return v8;
}

- (HDFHIRResourceObject)providedResource
{
  return self->_providedResource;
}

- (HDOriginalFHIRResourceObject)databaseResource
{
  return self->_databaseResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseResource, 0);

  objc_storeStrong((id *)&self->_providedResource, 0);
}

@end