@interface ActionTreeProgrammaticDetails
- (ActionTreeProgrammaticDetails)init;
- (NSMutableDictionary)streamNodeFormats;
@end

@implementation ActionTreeProgrammaticDetails

- (ActionTreeProgrammaticDetails)init
{
  v7.receiver = self;
  v7.super_class = (Class)ActionTreeProgrammaticDetails;
  v2 = [(ActionTreeProgrammaticDetails *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    streamNodeFormats = v2->_streamNodeFormats;
    v2->_streamNodeFormats = v3;

    v5 = v2;
  }

  return v2;
}

- (NSMutableDictionary)streamNodeFormats
{
  return self->_streamNodeFormats;
}

- (void).cxx_destruct
{
}

@end