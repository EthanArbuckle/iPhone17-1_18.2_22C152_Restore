@interface _GCDevicePIDVIDMatchingFilter
- (BOOL)match:(id)a3;
- (_GCDevicePIDVIDMatchingFilter)initWithVendorID:(id)a3 productIDs:(id)a4;
- (id)identifier;
@end

@implementation _GCDevicePIDVIDMatchingFilter

- (_GCDevicePIDVIDMatchingFilter)initWithVendorID:(id)a3 productIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePIDVIDMatchingFilter;
  v9 = [(_GCDevicePIDVIDMatchingFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vendorID, a3);
    objc_storeStrong((id *)&v10->_productIDs, a4);
  }

  return v10;
}

- (BOOL)match:(id)a3
{
  id v4 = a3;
  v5 = [v4 numberPropertyForKey:@"VendorID"];
  uint64_t v6 = [v4 numberPropertyForKey:@"ProductID"];
  id v7 = (void *)v6;
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    if ([(NSNumber *)self->_vendorID isEqualToNumber:v5])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v9 = self->_productIDs;
      uint64_t v8 = [(NSArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEqualToNumber:", v7, (void)v13))
            {
              LOBYTE(v8) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v8 = [(NSArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)identifier
{
  vendorID = self->_vendorID;
  v3 = [(NSArray *)self->_productIDs firstObject];
  id v4 = +[NSString stringWithFormat:@"vid(%@).pid(%@)", vendorID, v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIDs, 0);

  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end