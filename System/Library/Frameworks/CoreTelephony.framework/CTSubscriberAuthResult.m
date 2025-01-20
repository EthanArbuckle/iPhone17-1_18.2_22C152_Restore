@interface CTSubscriberAuthResult
+ (BOOL)supportsSecureCoding;
- (CTSubscriberAuthResult)initWithCoder:(id)a3;
- (NSData)auts;
- (NSData)ck;
- (NSData)ik;
- (NSData)kc;
- (NSData)res;
- (NSData)sres;
- (void)encodeWithCoder:(id)a3;
- (void)setAuts:(id)a3;
- (void)setCk:(id)a3;
- (void)setIk:(id)a3;
- (void)setKc:(id)a3;
- (void)setRes:(id)a3;
- (void)setSres:(id)a3;
@end

@implementation CTSubscriberAuthResult

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(CTSubscriberAuthResult *)self auts];
  [v10 encodeObject:v4 forKey:@"auts"];

  v5 = [(CTSubscriberAuthResult *)self res];
  [v10 encodeObject:v5 forKey:@"res"];

  v6 = [(CTSubscriberAuthResult *)self sres];
  [v10 encodeObject:v6 forKey:@"sres"];

  v7 = [(CTSubscriberAuthResult *)self kc];
  [v10 encodeObject:v7 forKey:@"kc"];

  v8 = [(CTSubscriberAuthResult *)self ck];
  [v10 encodeObject:v8 forKey:@"ck"];

  v9 = [(CTSubscriberAuthResult *)self ik];
  [v10 encodeObject:v9 forKey:@"ik"];
}

- (CTSubscriberAuthResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTSubscriberAuthResult;
  v5 = [(CTSubscriberAuthResult *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auts"];
    auts = v5->_auts;
    v5->_auts = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"res"];
    res = v5->_res;
    v5->_res = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sres"];
    sres = v5->_sres;
    v5->_sres = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kc"];
    kc = v5->_kc;
    v5->_kc = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ck"];
    ck = v5->_ck;
    v5->_ck = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ik"];
    ik = v5->_ik;
    v5->_ik = (NSData *)v16;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)auts
{
  return self->_auts;
}

- (void)setAuts:(id)a3
{
}

- (NSData)res
{
  return self->_res;
}

- (void)setRes:(id)a3
{
}

- (NSData)sres
{
  return self->_sres;
}

- (void)setSres:(id)a3
{
}

- (NSData)kc
{
  return self->_kc;
}

- (void)setKc:(id)a3
{
}

- (NSData)ck
{
  return self->_ck;
}

- (void)setCk:(id)a3
{
}

- (NSData)ik
{
  return self->_ik;
}

- (void)setIk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_ck, 0);
  objc_storeStrong((id *)&self->_kc, 0);
  objc_storeStrong((id *)&self->_sres, 0);
  objc_storeStrong((id *)&self->_res, 0);

  objc_storeStrong((id *)&self->_auts, 0);
}

@end