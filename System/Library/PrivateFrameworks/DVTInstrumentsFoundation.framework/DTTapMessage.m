@interface DTTapMessage
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (DTTapMessage)init;
- (DTTapMessage)initWithCoder:(id)a3;
- (id)initAsKind:(int)a3;
- (id)plist;
- (int)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setKind:(int)a3;
@end

@implementation DTTapMessage

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x263EFFA08];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v2 setWithObjects:v3, v4, v5, v6, nil];
    v8 = (void *)qword_268707F30;
    qword_268707F30 = v7;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTTapMessage;
  v2 = [(DTTapMessage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    plist = v2->_plist;
    v2->_plist = (NSMutableDictionary *)v3;

    [(DTTapMessage *)v2 setKind:0xFFFFFFFFLL];
  }
  return v2;
}

- (id)initAsKind:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)DTTapMessage;
  uint64_t v4 = [(DTTapMessage *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    plist = v4->_plist;
    v4->_plist = (NSMutableDictionary *)v5;

    [(DTTapMessage *)v4 setKind:v3];
  }
  return v4;
}

- (DTTapMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTTapMessage;
  uint64_t v5 = [(DTTapMessage *)&v10 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClasses:qword_268707F30 forKey:@"DTTapMessagePlist"];
    if (!v6)
    {
      objc_super v6 = [v4 decodeObjectOfClasses:qword_268707F30 forKey:@"$$0"];
    }
    uint64_t v7 = [v6 mutableCopy];
    plist = v5->_plist;
    v5->_plist = (NSMutableDictionary *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)plist
{
  return self->_plist;
}

- (int)kind
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"k"];
  int v4 = [v3 intValue];

  return v4;
}

- (void)setKind:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(DTTapMessage *)self plist];
  int v4 = [NSNumber numberWithInt:v3];
  [v5 setObject:v4 forKey:@"k"];
}

- (void).cxx_destruct
{
}

@end