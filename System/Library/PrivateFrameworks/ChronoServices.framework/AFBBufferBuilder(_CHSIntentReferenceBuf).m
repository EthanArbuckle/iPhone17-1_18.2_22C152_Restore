@interface AFBBufferBuilder(_CHSIntentReferenceBuf)
- (id)_chsCreateIntentReferenceBufUsingBlock:()_CHSIntentReferenceBuf;
- (id)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf;
- (id)_chsFinishedBufferWithRootIntentReferenceBufOfs:()_CHSIntentReferenceBuf error:;
- (uint64_t)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf;
- (uint64_t)_chsFinishBufferWithRootIntentReferenceBufOfs:()_CHSIntentReferenceBuf error:;
- (void)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf;
@end

@implementation AFBBufferBuilder(_CHSIntentReferenceBuf)

- (id)_chsCreateIntentReferenceBufUsingBlock:()_CHSIntentReferenceBuf
{
  v5 = a3;
  v6 = (void *)MEMORY[0x192FD70A0]();
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"_CHSRelevanceCache_generated.mm", 2443, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v7 = -[_CHSIntentReferenceBufBuilder initWithBufferBuilder:]((id *)[_CHSIntentReferenceBufBuilder alloc], a1);
  v5[2](v5, v7);
  v8 = -[_CHSRelevanceCacheBufBuilder _finish](v7);

  return v8;
}

- (id)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf
{
  *a2 = &unk_1EE09E478;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)_chsFinishedBufferWithRootIntentReferenceBufOfs:()_CHSIntentReferenceBuf error:
{
  id v7 = a3;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_CHSRelevanceCache_generated.mm", 2465, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v8 = [a1 firstError];

  if (v8)
  {
    if (a4)
    {
      [a1 firstError];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x192FD70A0]();
    v11 = [a1 path];
    if (!v11)
    {
      apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb], objc_msgSend(v7, "unsignedIntValue"), "RECA", 0);
      [a1 finalizeWithSelector:a2];
      operator new();
    }
    id v18 = 0;
    int v12 = [a1 _chsFinishBufferWithRootIntentReferenceBufOfs:v7 error:&v18];
    id v13 = v18;
    if (v12)
    {
      id v17 = v13;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v11 options:8 error:&v17];
      id v14 = v17;

      id v13 = v14;
    }
    else
    {
      v9 = 0;
    }

    if (a4) {
      *a4 = v13;
    }
  }
  return v9;
}

- (uint64_t)_chsFinishBufferWithRootIntentReferenceBufOfs:()_CHSIntentReferenceBuf error:
{
  id v7 = a3;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"_CHSRelevanceCache_generated.mm", 2499, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v8 = [a1 firstError];

  if (v8)
  {
    if (a4)
    {
      [a1 firstError];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x192FD70A0]();
    id v11 = v7;
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb], objc_msgSend(v11, "unsignedIntValue"), "RECA", 0);
    uint64_t BufferPointer = apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer((apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb]);
    id v13 = (_DWORD *)[a1 fbb];
    int v14 = v13[8];
    int v15 = v13[12];
    int v16 = v13[10];
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release((apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb], (uint64_t)v21);
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer((apple::aiml::flatbuffers2::DetachedBuffer *)v21);
    id v20 = 0;
    uint64_t v9 = [a1 finalizeWithSelector:a2 allocatorBufferAddr:BufferPointer size:(v14 - v15 + v16) error:&v20];
    id v17 = v20;

    if (a4) {
      *a4 = v17;
    }
  }
  return v9;
}

- (uint64_t)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_chsCreateVectorOfIntentReferenceBufWithOffsets:()_CHSIntentReferenceBuf
{
}

@end