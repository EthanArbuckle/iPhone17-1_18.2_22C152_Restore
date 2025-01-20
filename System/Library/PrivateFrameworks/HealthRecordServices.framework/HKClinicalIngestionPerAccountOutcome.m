@interface HKClinicalIngestionPerAccountOutcome
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalIngestionPerAccountOutcome)initWithAccountIdentifier:(id)a3 info:(unint64_t)a4;
- (HKClinicalIngestionPerAccountOutcome)initWithCoder:(id)a3;
- (NSUUID)accountIdentifier;
- (id)formattedInfoStringJoinedByString:(id)a3;
- (unint64_t)hash;
- (unint64_t)info;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalIngestionPerAccountOutcome

- (HKClinicalIngestionPerAccountOutcome)initWithAccountIdentifier:(id)a3 info:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKClinicalIngestionPerAccountOutcome;
  v7 = [(HKClinicalIngestionPerAccountOutcome *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = (NSUUID *)v8;

    v7->_info = a4;
  }

  return v7;
}

- (id)formattedInfoStringJoinedByString:(id)a3
{
  v45[12] = *MEMORY[0x263EF8340];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __74__HKClinicalIngestionPerAccountOutcome_formattedInfoStringJoinedByString___block_invoke;
  v44[3] = &unk_2645EF858;
  v44[4] = self;
  id v43 = a3;
  v3 = (void (**)(void, void))MEMORY[0x223C90C60](v44);
  v4 = NSString;
  v42 = v3[2](v3, 1);
  v41 = [v4 stringWithFormat:@"%@ gateway update", v42];
  v45[0] = v41;
  v5 = NSString;
  v40 = v3[2](v3, 2);
  v39 = [v5 stringWithFormat:@"%@ ingestion eligible", v40];
  v45[1] = v39;
  id v6 = NSString;
  v38 = v3[2](v3, 4);
  v37 = [v6 stringWithFormat:@"%@ perform file import", v38];
  v45[2] = v37;
  v7 = NSString;
  v36 = v3[2](v3, 8);
  v35 = [v7 stringWithFormat:@"%@ did ingest", v36];
  v45[3] = v35;
  uint64_t v8 = NSString;
  v34 = v3[2](v3, 16);
  v33 = [v8 stringWithFormat:@"%@ did run full ingest", v34];
  v45[4] = v33;
  v9 = NSString;
  v32 = v3[2](v3, 2048);
  v31 = [v9 stringWithFormat:@"%@ did upgrade to full ingest", v32];
  v45[5] = v31;
  v10 = NSString;
  v30 = v3[2](v3, 1024);
  v29 = [v10 stringWithFormat:@"%@ did postpone panel ingest", v30];
  v45[6] = v29;
  objc_super v11 = NSString;
  v28 = v3[2](v3, 32);
  v27 = [v11 stringWithFormat:@"%@ did run extraction", v28];
  v45[7] = v27;
  v12 = NSString;
  v13 = v3[2](v3, 64);
  v14 = [v12 stringWithFormat:@"%@ mark account as upgrade needed", v13];
  v45[8] = v14;
  v15 = NSString;
  v16 = v3[2](v3, 256);
  v17 = [v15 stringWithFormat:@"%@ did run stale resources operation", v16];
  v45[9] = v17;
  v18 = NSString;
  v19 = v3[2](v3, 512);
  v20 = [v18 stringWithFormat:@"%@ did detect gateway features", v19];
  v45[10] = v20;
  v21 = NSString;
  v22 = v3[2](v3, 4096);
  v23 = [v21 stringWithFormat:@"%@ did block account from ingest", v22];
  v45[11] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:12];

  v25 = [v24 componentsJoinedByString:v43];

  return v25;
}

__CFString *__74__HKClinicalIngestionPerAccountOutcome_formattedInfoStringJoinedByString___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(void *)(*(void *)(a1 + 32) + 16) & a2) != 0) {
    return @"[X]";
  }
  else {
    return @"[_]";
  }
}

- (unint64_t)hash
{
  return self->_info ^ [(NSUUID *)self->_accountIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKClinicalIngestionPerAccountOutcome *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      accountIdentifier = self->_accountIdentifier;
      uint64_t v8 = [(HKClinicalIngestionPerAccountOutcome *)v6 accountIdentifier];
      if (accountIdentifier == v8)
      {
        unint64_t info = self->_info;
        BOOL v13 = info == [(HKClinicalIngestionPerAccountOutcome *)v6 info];
      }
      else
      {
        v9 = [(HKClinicalIngestionPerAccountOutcome *)v6 accountIdentifier];
        if (v9)
        {
          v10 = self->_accountIdentifier;
          objc_super v11 = [(HKClinicalIngestionPerAccountOutcome *)v6 accountIdentifier];
          if ([(NSUUID *)v10 isEqual:v11])
          {
            unint64_t v12 = self->_info;
            BOOL v13 = v12 == [(HKClinicalIngestionPerAccountOutcome *)v6 info];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalIngestionPerAccountOutcome)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"Info"];

  v7 = [(HKClinicalIngestionPerAccountOutcome *)self initWithAccountIdentifier:v5 info:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"AccountIdentifier"];
  [v5 encodeInteger:self->_info forKey:@"Info"];
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end