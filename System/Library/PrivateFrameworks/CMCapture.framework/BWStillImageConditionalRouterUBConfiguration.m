@interface BWStillImageConditionalRouterUBConfiguration
+ (id)configurationWithPortTypes:(id)a3;
- (NSArray)portTypes;
- (unint64_t)outputIndexForPortType:(id)a3;
- (void)dealloc;
- (void)initWithPortTypes:(void *)a1;
@end

@implementation BWStillImageConditionalRouterUBConfiguration

+ (id)configurationWithPortTypes:(id)a3
{
  v3 = -[BWStillImageConditionalRouterUBConfiguration initWithPortTypes:]([BWStillImageConditionalRouterUBConfiguration alloc], a3);
  return v3;
}

- (void)initWithPortTypes:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    if ([a2 count])
    {
      v6.receiver = v2;
      v6.super_class = (Class)BWStillImageConditionalRouterUBConfiguration;
      v2 = objc_msgSendSuper2(&v6, sel_initWithNumberOfOutputs_, [a2 count]);
      if (v2)
      {
        v2[5] = a2;
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __66__BWStillImageConditionalRouterUBConfiguration_initWithPortTypes___block_invoke;
        v5[3] = &unk_1E5C25AE0;
        v5[4] = a2;
        [v2 setShouldEmitSampleBufferDecisionProvider:v5];
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v2;
}

BOOL __66__BWStillImageConditionalRouterUBConfiguration_initWithPortTypes___block_invoke(uint64_t a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  if (a3 && v4 != 0x7FFFFFFFFFFFFFFFLL) {
    *a3 = v4;
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageConditionalRouterUBConfiguration;
  [(BWStillImageConditionalRouterConfiguration *)&v3 dealloc];
}

- (unint64_t)outputIndexForPortType:(id)a3
{
  return [(NSArray *)self->_portTypes indexOfObject:a3];
}

- (NSArray)portTypes
{
  return self->_portTypes;
}

@end