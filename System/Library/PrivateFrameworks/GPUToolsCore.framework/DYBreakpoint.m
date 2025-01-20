@interface DYBreakpoint
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingName;
- (BOOL)breakAfter;
- (BOOL)breakBefore;
- (BOOL)noExec;
- (DYBreakpoint)init;
- (DYBreakpoint)initWithCoder:(id)a3;
- (NSArray)backtrace;
- (NSPredicate)predicate;
- (NSString)name;
- (NSString)predicateString;
- (NSString)threadName;
- (const)function;
- (id)_initWithPbuf:(Fbuf *)a3 type:(int)a4 backtrace:(id)a5 error:(int)a6;
- (id)_initWithType:(int)a3 backtrace:(id)a4 error:(int)a5;
- (id)description;
- (int)glError;
- (int)type;
- (unsigned)fenum;
- (void)_commonInit:(int)a3 backtrace:(id)a4 error:(int)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBreakAfter:(BOOL)a3;
- (void)setBreakBefore:(BOOL)a3;
- (void)setFenum:(unsigned int)a3;
- (void)setNoExec:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setPredicateString:(id)a3;
@end

@implementation DYBreakpoint

+ (id)keyPathsForValuesAffectingName
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"fenum"];
}

- (void)_commonInit:(int)a3 backtrace:(id)a4 error:(int)a5
{
  self->_fenum = -1;
  self->_type = a3;
  if (a3 == 1)
  {
    uint64_t v5 = 84;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v5 = 85;
LABEL_5:
    *((unsigned char *)&self->super.isa + v5) = 1;
  }
  self->_glError = a5;
  self->_backtrace = (NSArray *)a4;
}

- (id)_initWithPbuf:(Fbuf *)a3 type:(int)a4 backtrace:(id)a5 error:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)DYBreakpoint;
  v10 = [(DYBreakpoint *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(DYBreakpoint *)v10 _commonInit:v8 backtrace:a5 error:v6];
    v11->_fenum = *((_DWORD *)a3->var0.var0 + 1);
    v11->_fbufData = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytesNoCopy:a3->var0.var0 length:*(unsigned int *)a3->var0.var0 freeWhenDone:0];
  }
  return v11;
}

- (id)_initWithType:(int)a3 backtrace:(id)a4 error:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)DYBreakpoint;
  uint64_t v8 = [(DYBreakpoint *)&v11 init];
  v9 = v8;
  if (v8) {
    [(DYBreakpoint *)v8 _commonInit:v7 backtrace:a4 error:v5];
  }
  return v9;
}

- (DYBreakpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYBreakpoint;
  result = [(DYBreakpoint *)&v3 init];
  if (result) {
    result->_fenum = -1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYBreakpoint)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DYBreakpoint;
  v4 = [(DYBreakpoint *)&v10 init];
  if (v4)
  {
    -[DYBreakpoint setFenum:](v4, "setFenum:", [a3 decodeInt32ForKey:@"fenum"]);
    v4->_predicate = (NSPredicate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    v4->_breakBefore = [a3 decodeBoolForKey:@"breakBefore"];
    v4->_breakAfter = [a3 decodeBoolForKey:@"breakAfter"];
    v4->_noExec = [a3 decodeBoolForKey:@"noExec"];
    v4->_type = [a3 decodeInt32ForKey:@"type"];
    v4->_glError = [a3 decodeInt32ForKey:@"glError"];
    v4->_threadName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"threadName"];
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_backtrace = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"backtrace");
    uint64_t v7 = (NSMutableData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fbuf"];
    v4->_fbufData = v7;
    if ([(NSMutableData *)v7 length])
    {
      GPUTools::FB::Decoder::Decoder(v9, [a3 decodeInt32ForKey:@"fbuf version"], objc_msgSend(a3, "decodeBoolForKey:", @"little endian") ^ 1);
      operator new();
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_fenum forKey:@"fenum"];
  [a3 encodeObject:self->_predicate forKey:@"predicate"];
  [a3 encodeBool:self->_breakBefore forKey:@"breakBefore"];
  [a3 encodeBool:self->_breakAfter forKey:@"breakAfter"];
  [a3 encodeBool:self->_noExec forKey:@"noExec"];
  [a3 encodeInt32:self->_type forKey:@"type"];
  [a3 encodeInt32:self->_glError forKey:@"glError"];
  [a3 encodeObject:self->_threadName forKey:@"threadName"];
  [a3 encodeObject:self->_backtrace forKey:@"backtrace"];
  fbufData = self->_fbufData;
  if (fbufData)
  {
    [a3 encodeObject:fbufData forKey:@"fbuf"];
    [a3 encodeInt32:4 forKey:@"fbuf version"];
    [a3 encodeBool:1 forKey:@"little endian"];
  }
}

- (void)dealloc
{
  function = self->_function;
  if (function)
  {
    GPUTools::FD::Function::~Function((GPUTools::FD::Function *)function);
    MEMORY[0x253360DD0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DYBreakpoint;
  [(DYBreakpoint *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYBreakpoint;
  return (id)[NSString stringWithFormat:@"%@ fenum=%d name=%@", -[DYBreakpoint description](&v3, sel_description), self->_fenum, self->_name];
}

- (void)setFenum:(unsigned int)a3
{
  self->_fenum = a3;

  self->_name = (NSString *)(id)dy_fenum_to_function_name_nsstring(self->_fenum, 0, 0);
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (void)setPredicateString:(id)a3
{
  predicateString = self->_predicateString;
  if (predicateString != a3)
  {
    self->_predicateString = (NSString *)[a3 copy];

    [(DYBreakpoint *)self willChangeValueForKey:@"predicate"];
    predicate = self->_predicate;
    self->_predicate = (NSPredicate *)(id)[MEMORY[0x263F08A98] predicateWithFormat:self->_predicateString];

    [(DYBreakpoint *)self didChangeValueForKey:@"predicate"];
  }
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)fenum
{
  return self->_fenum;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)breakBefore
{
  return self->_breakBefore;
}

- (void)setBreakBefore:(BOOL)a3
{
  self->_breakBefore = a3;
}

- (BOOL)breakAfter
{
  return self->_breakAfter;
}

- (void)setBreakAfter:(BOOL)a3
{
  self->_breakAfter = a3;
}

- (BOOL)noExec
{
  return self->_noExec;
}

- (void)setNoExec:(BOOL)a3
{
  self->_noExec = a3;
}

- (const)function
{
  return self->_function;
}

- (int)type
{
  return self->_type;
}

- (int)glError
{
  return self->_glError;
}

- (NSArray)backtrace
{
  return self->_backtrace;
}

- (NSString)threadName
{
  return self->_threadName;
}

@end