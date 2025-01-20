@interface LSDefaultApplicationQueryEntry
+ (id)createFromPlistRepresentation:(id)a3;
- (BOOL)isDefaultForCategory;
- (LSDefaultApplicationQueryEntry)initWithWindowOpenDate:(id)a3 refreshDate:(id)a4 defaultForCategory:(BOOL)a5;
- (NSDate)refreshDate;
- (NSDate)windowOpenDate;
- (id)plistRepresentation;
@end

@implementation LSDefaultApplicationQueryEntry

- (LSDefaultApplicationQueryEntry)initWithWindowOpenDate:(id)a3 refreshDate:(id)a4 defaultForCategory:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LSDefaultApplicationQueryEntry;
  v11 = [(LSDefaultApplicationQueryEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_windowOpenDate, a3);
    objc_storeStrong((id *)&v12->_refreshDate, a4);
    v12->_defaultForCategory = a5;
  }

  return v12;
}

- (id)plistRepresentation
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Open";
  v6[1] = @"Refresh";
  refreshDate = self->_refreshDate;
  v7[0] = self->_windowOpenDate;
  v7[1] = refreshDate;
  v6[2] = @"IsDefault";
  v3 = [NSNumber numberWithBool:self->_defaultForCategory];
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (id)createFromPlistRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [v3 objectForKey:@"Open"];
    v6 = (void *)v5;
    if (v4 && v5 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v6 = 0;
    }
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v3 objectForKey:@"Refresh"];
    id v9 = (void *)v8;
    if (v7 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      id v9 = 0;
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v3 objectForKey:@"IsDefault"];
    v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v12 = 0;
    }
    v13 = 0;
    if (v6 && v9 && v12) {
      v13 = -[LSDefaultApplicationQueryEntry initWithWindowOpenDate:refreshDate:defaultForCategory:]([LSDefaultApplicationQueryEntry alloc], "initWithWindowOpenDate:refreshDate:defaultForCategory:", v6, v9, [v12 BOOLValue]);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDate)windowOpenDate
{
  return self->_windowOpenDate;
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (BOOL)isDefaultForCategory
{
  return self->_defaultForCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshDate, 0);

  objc_storeStrong((id *)&self->_windowOpenDate, 0);
}

@end