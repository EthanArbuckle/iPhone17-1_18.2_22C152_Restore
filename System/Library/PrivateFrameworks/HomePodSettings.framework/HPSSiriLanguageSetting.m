@interface HPSSiriLanguageSetting
+ (Class)valueClass;
- (HPSSiriLanguageSetting)initWithKeyPath:(id)a3;
- (id)languages;
@end

@implementation HPSSiriLanguageSetting

- (HPSSiriLanguageSetting)initWithKeyPath:(id)a3
{
  return [(HPSSetting *)self initWithKeyPath:a3 value:0];
}

- (id)languages
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(HPSSetting *)self value];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end