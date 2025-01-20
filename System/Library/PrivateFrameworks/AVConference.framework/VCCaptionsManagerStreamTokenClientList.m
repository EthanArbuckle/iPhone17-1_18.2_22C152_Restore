@interface VCCaptionsManagerStreamTokenClientList
+ (BOOL)isValidContext:(id)a3;
+ (int64_t)streamTokenFromClientContext:(id)a3;
- (NSArray)clientContextList;
- (VCCaptionsManagerStreamTokenClientList)initWithStreamToken:(int64_t)a3 captionsSource:(id)a4;
- (VCCaptionsSource)captionsSource;
- (id)newContext;
- (void)dealloc;
- (void)removeContext:(id)a3;
@end

@implementation VCCaptionsManagerStreamTokenClientList

- (VCCaptionsManagerStreamTokenClientList)initWithStreamToken:(int64_t)a3 captionsSource:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCCaptionsManagerStreamTokenClientList;
  v6 = [(VCCaptionsManagerStreamTokenClientList *)&v8 init];
  if (v6)
  {
    v6->_clientContextList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6->_streamToken = a3;
    v6->_captionsSource = (VCCaptionsSource *)a4;
  }
  return v6;
}

- (id)newContext
{
  v3 = [[VCCaptionsClientContext alloc] initWithStreamToken:self->_streamToken];
  [(NSMutableArray *)self->_clientContextList addObject:v3];
  return v3;
}

- (void)removeContext:(id)a3
{
}

+ (BOOL)isValidContext:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

+ (int64_t)streamTokenFromClientContext:(id)a3
{
  return [a3 streamToken];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsManagerStreamTokenClientList;
  [(VCCaptionsManagerStreamTokenClientList *)&v3 dealloc];
}

- (VCCaptionsSource)captionsSource
{
  return self->_captionsSource;
}

- (NSArray)clientContextList
{
  return &self->_clientContextList->super;
}

@end