@interface ATXRouteCacheKey
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation ATXRouteCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXRouteCacheKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        destinationLocation = self->destinationLocation;
        v8 = (NSString *)v6[1];
        if (destinationLocation == v8)
        {
        }
        else
        {
          v9 = v8;
          v10 = destinationLocation;
          char v11 = [(NSString *)v10 isEqual:v9];

          if ((v11 & 1) == 0) {
            goto LABEL_12;
          }
        }
        transportType = self->transportType;
        v14 = (NSString *)v6[2];
        if (transportType == v14)
        {
        }
        else
        {
          v15 = v14;
          v16 = transportType;
          char v17 = [(NSString *)v16 isEqual:v15];

          if ((v17 & 1) == 0)
          {
LABEL_12:
            BOOL v12 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        BOOL v12 = self->localOnlyAfterFirstUpdate == *((unsigned __int8 *)v6 + 24);
        goto LABEL_15;
      }
    }
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->destinationLocation hash];
  NSUInteger v4 = [(NSString *)self->transportType hash];
  return self->localOnlyAfterFirstUpdate - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@ to %@ (local:%i)]", self->transportType, self->destinationLocation, self->localOnlyAfterFirstUpdate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transportType, 0);

  objc_storeStrong((id *)&self->destinationLocation, 0);
}

@end