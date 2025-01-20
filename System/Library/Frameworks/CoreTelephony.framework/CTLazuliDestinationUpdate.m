@interface CTLazuliDestinationUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isBot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliDestinationUpdate:(id)a3;
- (CTLazuliDestination)discovered;
- (CTLazuliDestination)previous;
- (CTLazuliDestinationUpdate)initWithCoder:(id)a3;
- (CTLazuliDestinationUpdate)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscovered:(id)a3;
- (void)setIsBot:(BOOL)a3;
- (void)setPrevious:(id)a3;
@end

@implementation CTLazuliDestinationUpdate

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliDestinationUpdate *)self previous];
  [v3 appendFormat:@", previous = %@", v4];

  v5 = [(CTLazuliDestinationUpdate *)self discovered];
  [v3 appendFormat:@", discovered = %@", v5];

  [v3 appendFormat:@", isBot = %d", -[CTLazuliDestinationUpdate isBot](self, "isBot")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliDestinationUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliDestinationUpdate *)self previous];
  v6 = [v4 previous];
  if ([v5 isEqualToCTLazuliDestination:v6])
  {
    v7 = [(CTLazuliDestinationUpdate *)self discovered];
    v8 = [v4 discovered];
    if ([v7 isEqualToCTLazuliDestination:v8])
    {
      BOOL v9 = [(CTLazuliDestinationUpdate *)self isBot];
      int v10 = v9 ^ [v4 isBot] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliDestinationUpdate *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliDestinationUpdate *)self isEqualToCTLazuliDestinationUpdate:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliDestinationUpdate allocWithZone:a3];
  [(CTLazuliDestinationUpdate *)v4 setPrevious:self->_previous];
  [(CTLazuliDestinationUpdate *)v4 setDiscovered:self->_discovered];
  [(CTLazuliDestinationUpdate *)v4 setIsBot:self->_isBot];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_previous forKey:@"kPreviousKey"];
  [v4 encodeObject:self->_discovered forKey:@"kDiscoveredKey"];
  [v4 encodeBool:self->_isBot forKey:@"kIsBotKey"];
}

- (CTLazuliDestinationUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliDestinationUpdate;
  v5 = [(CTLazuliDestinationUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPreviousKey"];
    previous = v5->_previous;
    v5->_previous = (CTLazuliDestination *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDiscoveredKey"];
    discovered = v5->_discovered;
    v5->_discovered = (CTLazuliDestination *)v8;

    v5->_isBot = [v4 decodeBoolForKey:@"kIsBotKey"];
  }

  return v5;
}

- (CTLazuliDestinationUpdate)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliDestinationUpdate;
  id v4 = [(CTLazuliDestinationUpdate *)&v10 init];
  if (v4)
  {
    v5 = [[CTLazuliDestination alloc] initWithReflection:a3];
    previous = v4->_previous;
    v4->_previous = v5;

    v7 = [[CTLazuliDestination alloc] initWithReflection:(char *)a3 + 112];
    discovered = v4->_discovered;
    v4->_discovered = v7;

    v4->_isBot = *((unsigned char *)a3 + 224);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
}

- (CTLazuliDestination)discovered
{
  return self->_discovered;
}

- (void)setDiscovered:(id)a3
{
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovered, 0);

  objc_storeStrong((id *)&self->_previous, 0);
}

@end