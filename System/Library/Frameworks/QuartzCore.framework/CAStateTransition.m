@interface CAStateTransition
+ (BOOL)supportsSecureCoding;
+ (void)CAMLParserStartElement:(id)a3;
- (CAStateTransition)init;
- (CAStateTransition)initWithCoder:(id)a3;
- (NSArray)elements;
- (NSString)fromState;
- (NSString)toState;
- (double)duration;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setElements:(id)a3;
- (void)setFromState:(id)a3;
- (void)setToState:(id)a3;
@end

@implementation CAStateTransition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fromState
{
  return self->_fromState;
}

- (NSString)toState
{
  return self->_toState;
}

- (NSArray)elements
{
  return self->_elements;
}

- (double)duration
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  elements = self->_elements;
  uint64_t v3 = [(NSArray *)elements countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v23;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(elements);
      }
      v8 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) animation];
      if (v8)
      {
        v9 = v8;
        [v8 beginTime];
        double v11 = v10;
        [v9 duration];
        if ((*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          [v9 speed];
          if (v13 == 0.0)
          {
            double v12 = INFINITY;
          }
          else
          {
            float v14 = fabsf(v13);
            double v15 = 1.0;
            if (v14 != 1.0) {
              double v15 = 1.0 / v14;
            }
            [v9 repeatDuration];
            if (v16 == 0.0)
            {
              [v9 duration];
              double v15 = v17 * v15;
              if ([v9 autoreverses]) {
                double v15 = v15 + v15;
              }
              [v9 repeatCount];
              if (v18 <= 0.0) {
                double v16 = 1.0;
              }
              else {
                double v16 = v18;
              }
            }
            double v12 = v16 * v15;
          }
        }
        double v19 = v12 + v11;
        if (v19 > v6) {
          double v6 = v19;
        }
      }
    }
    uint64_t v4 = [(NSArray *)elements countByEnumeratingWithState:&v22 objects:v21 count:16];
  }
  while (v4);
  return v6;
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v4 = (void *)-[CAStateTransition CAMLTypeForKey:]::dict;
  if (!-[CAStateTransition CAMLTypeForKey:]::dict)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"fromState", @"string", @"toState", @"NSArray", @"elements", 0);
    -[CAStateTransition CAMLTypeForKey:]::dict = (uint64_t)v4;
  }

  return (id)[v4 objectForKey:a3];
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
}

- (CAStateTransition)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateTransition;
  uint64_t v4 = [(CAStateTransition *)&v6 init];
  if (v4)
  {
    v4->_fromState = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fromState"), "copy");
    v4->_toState = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"toState"), "copy");
    v4->_elements = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"elements"), "copy");
  }
  return v4;
}

- (void)setToState:(id)a3
{
}

- (void)setFromState:(id)a3
{
}

- (void)setElements:(id)a3
{
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

- (CAStateTransition)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)CAStateTransition;
  v2 = [(CAStateTransition *)&v4 init];
  if (v2)
  {
    v2->_fromState = (NSString *)@"*";
    v2->_toState = (NSString *)@"*";
  }
  return v2;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<CAStateTransition fromState=%@ toState=%@ %@>", self->_fromState, self->_toState, self->_elements];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(CAStateTransition);
  [(CAStateTransition *)v4 setFromState:self->_fromState];
  [(CAStateTransition *)v4 setToState:self->_toState];
  [(CAStateTransition *)v4 setElements:self->_elements];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  fromState = self->_fromState;
  if (fromState) {
    [a3 encodeObject:fromState forKey:@"fromState"];
  }
  toState = self->_toState;
  if (toState) {
    [a3 encodeObject:toState forKey:@"toState"];
  }
  if (self->_elements)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  fromState = self->_fromState;
  if (fromState) {
    [a3 setElementAttribute:fromState forKey:@"fromState"];
  }
  toState = self->_toState;
  if (toState) {
    [a3 setElementAttribute:toState forKey:@"toState"];
  }
  if (self->_elements)
  {
    [a3 beginPropertyElement:@"elements"];
    [a3 encodeObject:self->_elements];
    [a3 endElement];
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateTransition;
  [(CAStateTransition *)&v3 dealloc];
}

@end