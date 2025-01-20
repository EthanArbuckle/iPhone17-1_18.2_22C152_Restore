@interface CuttlefishPCSIdentity
+ (BOOL)supportsSecureCoding;
- (CKRecord)item;
- (CuttlefishPCSIdentity)initWithCoder:(id)a3;
- (CuttlefishPCSServiceIdentifier)service;
- (id)description;
- (id)init:(id)a3 item:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setService:(id)a3;
@end

@implementation CuttlefishPCSIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)setItem:(id)a3
{
}

- (CKRecord)item
{
  return (CKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (void)setService:(id)a3
{
}

- (CuttlefishPCSServiceIdentifier)service
{
  return (CuttlefishPCSServiceIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (CuttlefishPCSIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CuttlefishPCSIdentity;
  v5 = [(CuttlefishPCSIdentity *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    service = v5->_service;
    v5->_service = (CuttlefishPCSServiceIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item"];
    item = v5->_item;
    v5->_item = (CKRecord *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CuttlefishPCSIdentity *)self service];
  [v4 encodeObject:v5 forKey:@"service"];

  id v6 = [(CuttlefishPCSIdentity *)self item];
  [v4 encodeObject:v6 forKey:@"item"];
}

- (id)description
{
  v2 = [(CuttlefishPCSIdentity *)self service];
  v3 = +[NSString stringWithFormat:@"<CuttlefishPCSIdentity(%@)>", v2];

  return v3;
}

- (id)init:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuttlefishPCSIdentity;
  v9 = [(CuttlefishPCSIdentity *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end