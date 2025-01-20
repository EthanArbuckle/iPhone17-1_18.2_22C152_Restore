@interface HMISignpost
- (BOOL)hasBegun;
- (BOOL)shouldSignpost;
- (HMISignpost)initWithName:(id)a3;
- (HMISignpost)initWithName:(id)a3 deferred:(BOOL)a4;
- (NSDate)beginDate;
- (NSString)name;
- (NSUUID)identifier;
- (id)logIdentifier;
- (unint64_t)signpostIdentifier;
- (void)begin;
- (void)end;
@end

@implementation HMISignpost

- (HMISignpost)initWithName:(id)a3
{
  return [(HMISignpost *)self initWithName:a3 deferred:0];
}

- (HMISignpost)initWithName:(id)a3 deferred:(BOOL)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMISignpost;
  v7 = [(HMISignpost *)&v16 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v10;

    v12 = v7->_identifier;
    unint64_t v17 = 0;
    v18[0] = 0;
    v18[1] = 0;
    [(NSUUID *)v12 getUUIDBytes:v18];
    v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v18 length:16 freeWhenDone:0];
    objc_msgSend(v13, "getBytes:range:", &v17, objc_msgSend(v13, "length") - 8, 8);

    unint64_t v14 = v17;
    if (v17 + 1 < 2) {
      unint64_t v14 = 0xEEEEB0B5B2B2EEEELL;
    }
    v7->_signpostIdentifier = v14;
    if (!a4) {
      [(HMISignpost *)v7 begin];
    }
  }

  return v7;
}

- (BOOL)shouldSignpost
{
  v3 = +[HMIPreference sharedInstance];
  BOOL v4 = 0;
  if ([v3 BOOLPreferenceForKey:@"enableSignposts" defaultValue:0])
  {
    v5 = [(HMISignpost *)self signpostLog];
    BOOL v4 = os_signpost_enabled(v5);
  }
  return v4;
}

- (BOOL)hasBegun
{
  v2 = [(HMISignpost *)self beginDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)begin
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(HMISignpost *)self hasBegun])
  {
    BOOL v3 = [MEMORY[0x263EFF910] date];
    beginDate = self->_beginDate;
    self->_beginDate = v3;

    if ([(HMISignpost *)self shouldSignpost])
    {
      v5 = [(HMISignpost *)self signpostLog];
      unint64_t v6 = [(HMISignpost *)self signpostIdentifier];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          uint64_t v8 = [(HMISignpost *)self identifier];
          v9 = [v8 UUIDString];
          uint64_t v10 = [(HMISignpost *)self name];
          int v11 = 138412546;
          v12 = v9;
          __int16 v13 = 2112;
          unint64_t v14 = v10;
          _os_signpost_emit_with_name_impl(&dword_225DC6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HMISignpost", "Identifier = %@, Name = %@", (uint8_t *)&v11, 0x16u);
        }
      }
    }
  }
}

- (void)end
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(HMISignpost *)self shouldSignpost])
  {
    BOOL v3 = [(HMISignpost *)self signpostLog];
    unint64_t v4 = [(HMISignpost *)self signpostIdentifier];
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        unint64_t v6 = [(HMISignpost *)self identifier];
        os_signpost_id_t v7 = [v6 UUIDString];
        uint64_t v8 = [(HMISignpost *)self name];
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        v12 = v8;
        _os_signpost_emit_with_name_impl(&dword_225DC6000, v3, OS_SIGNPOST_INTERVAL_END, v5, "HMISignpost", "Identifier = %@, Name = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (id)logIdentifier
{
  v2 = NSString;
  name = self->_name;
  unint64_t v4 = [(NSUUID *)self->_identifier UUIDString];
  os_signpost_id_t v5 = [v2 stringWithFormat:@"%@ (%@)", name, v4];

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end