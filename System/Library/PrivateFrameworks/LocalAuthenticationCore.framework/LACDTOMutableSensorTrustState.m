@interface LACDTOMutableSensorTrustState
+ (id)nullInstance;
- (BOOL)_containsDisapprovedSensorIDFlag:(id)a3;
- (BOOL)isDisapproved;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableSensorTrustState)initWithTrustState:(id)a3;
- (NSData)installedSensorID;
- (NSData)trustedSensorID;
- (NSString)description;
- (id)_disapprovedSensorIDFlag;
- (void)disapprove;
- (void)setInstalledSensorID:(id)a3;
- (void)setTrustedSensorID:(id)a3;
@end

@implementation LACDTOMutableSensorTrustState

- (LACDTOMutableSensorTrustState)initWithTrustState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOMutableSensorTrustState;
  v5 = [(LACDTOMutableSensorTrustState *)&v9 init];
  if (v5)
  {
    v6 = [v4 installedSensorID];
    [(LACDTOMutableSensorTrustState *)v5 setInstalledSensorID:v6];

    v7 = [v4 trustedSensorID];
    [(LACDTOMutableSensorTrustState *)v5 setTrustedSensorID:v7];
  }
  return v5;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(LACDTOMutableSensorTrustState);
  [(LACDTOMutableSensorTrustState *)v2 setInstalledSensorID:0];
  [(LACDTOMutableSensorTrustState *)v2 setTrustedSensorID:0];
  return v2;
}

- (BOOL)isDisapproved
{
  v3 = [(LACDTOMutableSensorTrustState *)self trustedSensorID];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  v5 = [(LACDTOMutableSensorTrustState *)self trustedSensorID];
  BOOL v6 = [(LACDTOMutableSensorTrustState *)self _containsDisapprovedSensorIDFlag:v5];

  return v6;
}

- (void)disapprove
{
  id v3 = [(LACDTOMutableSensorTrustState *)self _disapprovedSensorIDFlag];
  [(LACDTOMutableSensorTrustState *)self setTrustedSensorID:v3];
}

- (BOOL)_containsDisapprovedSensorIDFlag:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v3, "length"));
    objc_msgSend(v4, "resetBytesInRange:", 0, objc_msgSend(v4, "length"));
    char v5 = [v3 isEqual:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_disapprovedSensorIDFlag
{
  char v4 = 0;
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4 length:1];
  return v2;
}

- (NSString)description
{
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  char v4 = NSString;
  char v5 = [(LACDTOMutableSensorTrustState *)self installedSensorID];
  BOOL v6 = [v4 stringWithFormat:@"installedSensorID: %@", v5];
  v18[0] = v6;
  v7 = NSString;
  v8 = [(LACDTOMutableSensorTrustState *)self trustedSensorID];
  objc_super v9 = [v7 stringWithFormat:@"trustedSensorID: %@", v8];
  v18[1] = v9;
  v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableSensorTrustState isDisapproved](self, "isDisapproved"));
  v12 = [v10 stringWithFormat:@"isDisapproved: %@", v11];
  v18[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v14 = [v13 componentsJoinedByString:@"; "];
  v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_27043B350])
  {
    id v5 = v4;
    BOOL v6 = [(LACDTOMutableSensorTrustState *)self installedSensorID];
    uint64_t v7 = [v5 installedSensorID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      objc_super v9 = [(LACDTOMutableSensorTrustState *)self installedSensorID];
      v10 = [v5 installedSensorID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(LACDTOMutableSensorTrustState *)self trustedSensorID];
    uint64_t v14 = [v5 trustedSensorID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(LACDTOMutableSensorTrustState *)self trustedSensorID];
      v17 = [v5 trustedSensorID];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        LOBYTE(v12) = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    BOOL v19 = [(LACDTOMutableSensorTrustState *)self isDisapproved];
    int v12 = v19 ^ [v5 isDisapproved] ^ 1;
    goto LABEL_12;
  }
  LOBYTE(v12) = 0;
LABEL_13:

  return v12;
}

- (NSData)installedSensorID
{
  return self->_installedSensorID;
}

- (void)setInstalledSensorID:(id)a3
{
}

- (NSData)trustedSensorID
{
  return self->_trustedSensorID;
}

- (void)setTrustedSensorID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedSensorID, 0);
  objc_storeStrong((id *)&self->_installedSensorID, 0);
}

@end