@interface CAState
+ (BOOL)supportsSecureCoding;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isInitial;
- (BOOL)isLocked;
- (CAState)init;
- (CAState)initWithCoder:(id)a3;
- (NSArray)elements;
- (NSString)basedOn;
- (NSString)name;
- (double)nextDelay;
- (double)previousDelay;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)addElement:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)foreachLayer:(id)a3;
- (void)removeElement:(id)a3;
- (void)setBasedOn:(id)a3;
- (void)setElements:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInitial:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNextDelay:(double)a3;
- (void)setPreviousDelay:(double)a3;
@end

@implementation CAState

- (void)setElements:(id)a3
{
  elements = self->_elements;
  if (elements != a3)
  {

    self->_elements = (NSMutableArray *)[a3 mutableCopy];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)basedOn
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)elements
{
  return &self->_elements->super;
}

- (NSString)name
{
  return self->_name;
}

- (double)nextDelay
{
  return self->_nextDelay;
}

- (double)previousDelay
{
  return self->_previousDelay;
}

- (id)CAMLTypeForKey:(id)a3
{
  v4 = (void *)-[CAState CAMLTypeForKey:]::dict;
  if (!-[CAState CAMLTypeForKey:]::dict)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"name", @"string", @"basedOn", @"BOOL", @"enabled", @"NSArray", @"elements", @"real", @"nextDelay", @"real", @"previousDelay", @"BOOL", @"locked", @"BOOL", @"initial", 0);
    -[CAState CAMLTypeForKey:]::dict = (uint64_t)v4;
  }

  return (id)[v4 objectForKey:a3];
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
}

- (CAState)initWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CAState;
  v4 = [(CAState *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    *(int64x2_t *)&v4->_nextDelay = vdupq_n_s64(0x7FF0000000000000uLL);
    v4->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v5->_basedOn = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"basedOn"];
    v5->_elements = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"elements"), "mutableCopy");
    if ([a3 containsValueForKey:@"nextDelay"])
    {
      [a3 decodeDoubleForKey:@"nextDelay"];
      v5->_nextDelay = v6;
    }
    if ([a3 containsValueForKey:@"previousDelay"])
    {
      [a3 decodeDoubleForKey:@"previousDelay"];
      v5->_previousDelay = v7;
    }
    if ([a3 containsValueForKey:@"enabled"]) {
      v5->_enabled = [a3 decodeBoolForKey:@"enabled"];
    }
    if ([a3 containsValueForKey:@"locked"]) {
      v5->_locked = [a3 decodeBoolForKey:@"locked"];
    }
    if ([a3 containsValueForKey:@"initial"]) {
      v5->_initial = [a3 decodeBoolForKey:@"initial"];
    }
  }
  return v5;
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

- (CAState)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->_enabled = 1;
  *(int64x2_t *)&self->_nextDelay = vdupq_n_s64(0x7FF0000000000000uLL);
  v3.receiver = self;
  v3.super_class = (Class)CAState;
  return [(CAState *)&v3 init];
}

- (void)setName:(id)a3
{
}

- (void)setInitial:(BOOL)a3
{
  self->_initial = a3;
}

- (BOOL)isInitial
{
  return self->_initial;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setPreviousDelay:(double)a3
{
  self->_previousDelay = a3;
}

- (void)setNextDelay:(double)a3
{
  self->_nextDelay = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setBasedOn:(id)a3
{
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_initial) {
    v5 = " initial";
  }
  else {
    v5 = "";
  }
  if (self->_locked) {
    double v6 = " locked";
  }
  else {
    double v6 = "";
  }
  return (id)[v3 stringWithFormat:@"{%@:%p %@ basedOn %@ %@%s%s}", v4, self, *(_OWORD *)&self->_name, self->_elements, v5, v6];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAState;
  [(CAState *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  basedOn = self->_basedOn;
  if (basedOn) {
    [a3 encodeObject:basedOn forKey:@"basedOn"];
  }
  elements = self->_elements;
  if (elements) {
    [a3 encodeObject:elements forKey:@"elements"];
  }
  if ((*(void *)&self->_nextDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"nextDelay");
  }
  if ((*(void *)&self->_previousDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"previousDelay");
  }
  if (!self->_enabled) {
    [a3 encodeBool:0 forKey:@"enabled"];
  }
  if (self->_locked) {
    [a3 encodeBool:1 forKey:@"locked"];
  }
  if (self->_initial)
  {
    [a3 encodeBool:1 forKey:@"initial"];
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  if (name) {
    [a3 setElementAttribute:name forKey:@"name"];
  }
  basedOn = self->_basedOn;
  if (basedOn) {
    [a3 setElementAttribute:basedOn forKey:@"basedOn"];
  }
  if (!self->_enabled) {
    [a3 setElementAttribute:@"false" forKey:@"enabled"];
  }
  if (self->_locked) {
    [a3 setElementAttribute:@"true" forKey:@"locked"];
  }
  if (self->_initial) {
    [a3 setElementAttribute:@"true" forKey:@"initial"];
  }
  if ((*(void *)&self->_nextDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v11[0] = *(void *)&self->_nextDelay;
    CFStringRef v7 = CACreateStringWithDoubleArray((uint64_t)v11, 1uLL, 0.001);
    if (v7)
    {
      CFStringRef v8 = v7;
      [a3 setElementAttribute:v7 forKey:@"nextDelay"];
      CFRelease(v8);
    }
  }
  if ((*(void *)&self->_previousDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v11[0] = *(void *)&self->_previousDelay;
    CFStringRef v9 = CACreateStringWithDoubleArray((uint64_t)v11, 1uLL, 0.001);
    if (v9)
    {
      CFStringRef v10 = v9;
      [a3 setElementAttribute:v9 forKey:@"previousDelay"];
      CFRelease(v10);
    }
  }
  if (self->_elements)
  {
    [a3 beginPropertyElement:@"elements"];
    [a3 encodeObject:self->_elements];
    [a3 endElement];
  }
}

- (void)foreachLayer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  elements = self->_elements;
  uint64_t v5 = [(NSMutableArray *)elements countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(elements);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) foreachLayer:a3];
      }
      uint64_t v6 = [(NSMutableArray *)elements countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)removeElement:(id)a3
{
  elements = self->_elements;
  if (elements) {
    [(NSMutableArray *)elements removeObjectIdenticalTo:a3];
  }
}

- (void)addElement:(id)a3
{
  elements = self->_elements;
  if (!elements)
  {
    elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_elements = elements;
  }

  [(NSMutableArray *)elements addObject:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    *((void *)v4 + 1) = [(NSString *)self->_name copy];
    *((void *)v4 + 2) = [(NSString *)self->_basedOn copy];
    *((unsigned char *)v4 + 48) = self->_enabled;
    *((unsigned char *)v4 + 49) = self->_locked;
    *((unsigned char *)v4 + 50) = self->_initial;
    if (self->_elements)
    {
      *((void *)v4 + 3) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      elements = self->_elements;
      uint64_t v6 = [(NSMutableArray *)elements countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(elements);
            }
            long long v10 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copy];
            [*((id *)v4 + 3) addObject:v10];
          }
          uint64_t v7 = [(NSMutableArray *)elements countByEnumeratingWithState:&v13 objects:v12 count:16];
        }
        while (v7);
      }
    }
    *((void *)v4 + 4) = *(void *)&self->_nextDelay;
    *((void *)v4 + 5) = *(void *)&self->_previousDelay;
  }
  return v4;
}

@end