@interface DYExtension
- (DYExtension)init;
- (NSBundle)bundle;
- (NSString)identifier;
- (NSString)slot;
- (id)_initWithDictionary:(id)a3 bundle:(id)a4;
- (id)description;
- (id)objectForKey:(id)a3;
- (void)dealloc;
@end

@implementation DYExtension

- (DYExtension)init
{
  return 0;
}

- (id)_initWithDictionary:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)DYExtension;
  v6 = [(DYExtension *)&v10 init];
  if (v6)
  {
    v7 = (NSString *)(id)[a3 objectForKey:@"slot"];
    v6->_slot = v7;
    if (v7
      && (v8 = (NSString *)(id)[a3 objectForKey:@"identifier"],
          (v6->_identifier = v8) != 0))
    {
      v6->_dictionary = (NSDictionary *)a3;
      v6->_bundle = (NSBundle *)a4;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYExtension;
  [(DYExtension *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYExtension;
  return (id)[NSString stringWithFormat:@"%@: slot=%@ identifier=%@ bundle=%@", -[DYExtension description](&v3, sel_description), self->_slot, self->_identifier, self->_bundle];
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKey:a3];
}

- (NSString)slot
{
  return self->_slot;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

@end