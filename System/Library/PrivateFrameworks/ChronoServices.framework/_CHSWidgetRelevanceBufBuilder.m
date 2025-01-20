@interface _CHSWidgetRelevanceBufBuilder
- (id)initWithBufferBuilder:(id *)a1;
- (void)dealloc;
- (void)setAttributeKey:(id)a3;
- (void)setIntentReference:(id)a3;
@end

@implementation _CHSWidgetRelevanceBufBuilder

- (id)initWithBufferBuilder:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)_CHSWidgetRelevanceBufBuilder;
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
  v4.super_class = (Class)_CHSWidgetRelevanceBufBuilder;
  [(_CHSWidgetRelevanceBufBuilder *)&v4 dealloc];
}

- (void)setAttributeKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1890, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, [v7 unsignedIntValue]);
  }
}

- (void)setIntentReference:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1900, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, [v7 unsignedIntValue]);
  }
}

- (void).cxx_destruct
{
}

@end