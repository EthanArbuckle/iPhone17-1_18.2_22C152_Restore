@interface CTPerAppDataUsage
+ (BOOL)supportsSecureCoding;
- (CTPerAppDataUsage)initWithCoder:(id)a3;
- (NSArray)used;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)init:(id)a3 withPeriods:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation CTPerAppDataUsage

- (id)init:(id)a3 withPeriods:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4)
  {
    v23.receiver = self;
    v23.super_class = (Class)CTPerAppDataUsage;
    v8 = [(CTPerAppDataUsage *)&v23 init];
    v9 = v8;
    if (v8)
    {
      id v22 = v7;
      objc_storeStrong((id *)&v8->_displayName, a3);
      v21[1] = v21;
      unint64_t v10 = 8 * a4;
      v11 = (char *)v21 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, 8 * a4);
      uint64_t v12 = 0;
      do
      {
        v13 = [CTDataUsed alloc];
        v14 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
        v15 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
        uint64_t v16 = [(CTDataUsed *)v13 initWithUsage:v14 proxied:v15];
        v17 = *(void **)&v11[8 * v12];
        *(void *)&v11[8 * v12] = v16;

        ++v12;
      }
      while (a4 != v12);
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:(char *)v21 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
      used = v9->_used;
      v9->_used = (NSArray *)v18;

      do
      {

        v10 -= 8;
      }
      while (v10);
      id v7 = v22;
    }
    self = v9;
    a4 = (unint64_t)self;
  }

  return (id)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CTPerAppDataUsage *)self displayName];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(CTPerAppDataUsage *)self used];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CTPerAppDataUsage *)self displayName];
  [v4 encodeObject:v5 forKey:@"displayNameKey"];

  id v6 = [(CTPerAppDataUsage *)self used];
  [v4 encodeObject:v6 forKey:@"usageKey"];
}

- (CTPerAppDataUsage)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTPerAppDataUsage;
  uint64_t v5 = [(CTPerAppDataUsage *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameKey"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    unint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"usageKey"];
    used = v5->_used;
    v5->_used = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)used
{
  return self->_used;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end