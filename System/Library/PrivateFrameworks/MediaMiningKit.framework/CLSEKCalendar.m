@interface CLSEKCalendar
- (BOOL)hasSharees;
- (BOOL)isEqual:(id)a3;
- (CLSEKCalendar)initWithCoder:(id)a3;
- (CLSEKCalendar)initWithEKCalendar:(id)a3;
- (NSSet)shareesAndOwner;
- (NSString)calendarIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSEKCalendar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_shareesAndOwner, 0);
}

- (NSString)calendarIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)shareesAndOwner
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)hasSharees
{
  return self->_hasSharees;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSEKCalendar *)a3;
  if (self == v4) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  unint64_t v5 = [(CLSEKCalendar *)self hash];
  if (v5 == [(CLSEKCalendar *)v4 hash]) {
    goto LABEL_4;
  }
  if (self->_hasSharees != v4->_hasSharees)
  {
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  shareesAndOwner = self->_shareesAndOwner;
  if (shareesAndOwner != v4->_shareesAndOwner)
  {
    char v6 = -[NSSet isEqualToSet:](shareesAndOwner, "isEqualToSet:");
    goto LABEL_9;
  }
LABEL_4:
  char v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_calendarIdentifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  calendarIdentifier = self->_calendarIdentifier;
  id v5 = a3;
  [v5 encodeObject:calendarIdentifier forKey:@"calendarIdentifier"];
  [v5 encodeBool:self->_hasSharees forKey:@"hasSharees"];
  [v5 encodeObject:self->_shareesAndOwner forKey:@"shareesAndOwner"];
}

- (CLSEKCalendar)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSEKCalendar;
  id v5 = [(CLSEKCalendar *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarIdentifier"];
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v6;

    v5->_hasSharees = [v4 decodeBoolForKey:@"hasSharees"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"shareesAndOwner"];
    shareesAndOwner = v5->_shareesAndOwner;
    v5->_shareesAndOwner = (NSSet *)v11;
  }
  return v5;
}

- (CLSEKCalendar)initWithEKCalendar:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLSEKCalendar;
  id v5 = [(CLSEKCalendar *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 calendarIdentifier];
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v6;

    int v8 = [v4 hasSharees];
    v5->_hasSharees = v8;
    if (v8)
    {
      uint64_t v9 = [v4 shareesAndOwner];
      objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v11 = v9;
      uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
            v17 = [CLSEKSharee alloc];
            v18 = -[CLSEKSharee initWithEKSharee:](v17, "initWithEKSharee:", v16, (void)v22);
            if (v18) {
              [(NSSet *)v10 addObject:v18];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      shareesAndOwner = v5->_shareesAndOwner;
      v5->_shareesAndOwner = v10;
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v11 = v5->_shareesAndOwner;
      v5->_shareesAndOwner = (NSSet *)v20;
    }
  }
  return v5;
}

@end