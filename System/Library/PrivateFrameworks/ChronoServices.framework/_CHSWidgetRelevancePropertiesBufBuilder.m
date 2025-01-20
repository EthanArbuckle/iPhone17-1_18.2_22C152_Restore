@interface _CHSWidgetRelevancePropertiesBufBuilder
- (id)initWithBufferBuilder:(id *)a1;
- (void)dealloc;
- (void)setExtensionIdentity:(id)a3;
- (void)setIsDeletion:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setLastRelevanceUpdate:(double)a3;
- (void)setRelevances:(id)a3;
- (void)setSupportsBackgroundRefresh:(BOOL)a3;
@end

@implementation _CHSWidgetRelevancePropertiesBufBuilder

- (id)initWithBufferBuilder:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)_CHSWidgetRelevancePropertiesBufBuilder;
    v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      v6 = [v4 firstError];

      if (!v6) {
        operator new();
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x192FD6D90](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CHSWidgetRelevancePropertiesBufBuilder;
  [(_CHSWidgetRelevancePropertiesBufBuilder *)&v4 dealloc];
}

- (void)setExtensionIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1399, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, [v7 unsignedIntValue]);
  }
}

- (void)setKind:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1409, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, [v7 unsignedIntValue]);
  }
}

- (void)setSupportsBackgroundRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((unint64_t)self->_bldr->var0, 8, v3, 0);
  }
}

- (void)setIsDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((unint64_t)self->_bldr->var0, 10, v3, 0);
  }
}

- (void)setLastRelevanceUpdate:(double)a3
{
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((unint64_t)self->_bldr->var0, 12, a3, 0.0);
  }
}

- (void)setRelevances:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1440, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 14, [v7 unsignedIntValue]);
  }
}

- (void).cxx_destruct
{
}

@end