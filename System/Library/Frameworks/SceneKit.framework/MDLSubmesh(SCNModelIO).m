@interface MDLSubmesh(SCNModelIO)
+ (id)submeshWithSCNGeometryElement:()SCNModelIO;
+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:;
+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:;
+ (id)submeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:;
+ (uint64_t)newSubmeshWithGeometryData:()SCNModelIO indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:;
+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:;
+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:;
+ (uint64_t)newSubmeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:;
@end

@implementation MDLSubmesh(SCNModelIO)

+ (id)submeshWithSCNGeometryElement:()SCNModelIO
{
  v3 = (void *)[a1 newSubmeshWithSCNGeometryElement:a3 bufferAllocator:0];

  return v3;
}

+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:
{
  v1 = objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:");

  return v1;
}

+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:
{
  v1 = objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:");

  return v1;
}

+ (id)submeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:
{
  v1 = objc_msgSend(a1, "newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:");

  return v1;
}

+ (uint64_t)newSubmeshWithGeometryData:()SCNModelIO indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:
{
  unint64_t v20 = a12;
  uint64_t v21 = [a3 bytes];
  if (a6 >= 2 && a5)
  {
    uint64_t v22 = v21;
    unint64_t v23 = a8 * a6;
    v24 = (void *)[MEMORY[0x263EFF990] dataWithLength:a4 / a6];
    uint64_t v25 = [v24 mutableBytes];
    if (a8 * a6 <= a4)
    {
      uint64_t v26 = 0;
      if (a4 / v23 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = a4 / v23;
      }
      do
      {
        switch(a8)
        {
          case 1uLL:
            *(unsigned char *)(v25 + v26) = *(unsigned char *)(v22 + a7);
            break;
          case 2uLL:
            *(_WORD *)(v25 + 2 * v26) = *(_WORD *)(v22 + 2 * a7);
            break;
          case 4uLL:
            *(_DWORD *)(v25 + 4 * v26) = *(_DWORD *)(v22 + 4 * a7);
            break;
          case 8uLL:
            *(void *)(v25 + 8 * v26) = *(void *)(v22 + 8 * a7);
            break;
          default:
            break;
        }
        ++v26;
        a7 += a6;
      }
      while (v27 != v26);
    }
    v28 = a11;
    uint64_t v29 = (uint64_t)v24;
  }
  else
  {
    uint64_t v29 = objc_msgSend(a3, "subdataWithRange:", objc_msgSend(a3, "length") / a6 * a7);
    v28 = a11;
  }
  v30 = (void *)[v28 newBufferWithData:v29 type:2];
  id v31 = [a1 alloc];
  if (!a12) {
    unint64_t v20 = [v30 length] / a8;
  }
  uint64_t v32 = [v31 initWithName:&stru_26BF72F58 indexBuffer:v30 indexCount:v20 indexType:a9 geometryType:a10 material:0 topology:a13];

  return v32;
}

+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:
{
  return [a1 newSubmeshWithSCNGeometryElement:a3 bufferAllocator:a4 positionSourceChannel:0];
}

+ (uint64_t)newSubmeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:
{
  unint64_t v9 = [a4 bytesPerIndex];
  uint64_t v10 = [a4 primitiveCount];
  if (+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::onceToken != -1) {
    dispatch_once(&+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::onceToken, &__block_literal_global_90);
  }
  if (a5) {
    v11 = a5;
  }
  else {
    v11 = (void *)+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::defaultAllocator;
  }
  v12 = (void *)[v11 newBufferWithData:a3 type:2];
  uint64_t v13 = [a4 bytesPerIndex];
  uint64_t v14 = 32;
  if (v13 == 2) {
    uint64_t v14 = 16;
  }
  if (v13 == 1) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = v14;
  }
  if ([a4 primitiveType] == 1)
  {
    uint64_t v16 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_26BF72F58, v12, objc_msgSend(a4, "primitiveCount") + 2, v15, 3, 0, 0);
LABEL_28:
    uint64_t v24 = v16;
    goto LABEL_29;
  }
  if ([a4 primitiveType] != 4)
  {
    unint64_t v25 = [a4 primitiveType];
    if (v25 > 3)
    {
      uint64_t v27 = 0;
      uint64_t v26 = 1;
    }
    else
    {
      uint64_t v26 = qword_20B5CB720[v25];
      uint64_t v27 = qword_20B5CB740[v25];
    }
    uint64_t v16 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_26BF72F58, v12, objc_msgSend(a4, "primitiveCount") * v26, v15, v27, 0, 0);
    goto LABEL_28;
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "data"), "bytes");
  v18 = (void *)[MEMORY[0x263EFF990] dataWithLength:8 * v10];
  uint64_t v19 = [v18 mutableBytes];
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      switch(v9)
      {
        case 1uLL:
          LOBYTE(v21) = *(unsigned char *)(v17 + i);
          goto LABEL_21;
        case 2uLL:
          LOWORD(v21) = *(_WORD *)(v17 + 2 * i);
          goto LABEL_21;
        case 4uLL:
          LODWORD(v21) = *(_DWORD *)(v17 + 4 * i);
          goto LABEL_21;
        case 8uLL:
          uint64_t v21 = *(void *)(v17 + 8 * i);
LABEL_21:
          *(unsigned char *)(v19 + i) = v21;
          break;
        default:
          continue;
      }
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x263F13670]);
  uint64_t v23 = [objc_alloc(MEMORY[0x263F13628]) initWithType:2 data:v18];
  [v22 setFaceCount:v10];
  [v22 setFaceTopology:v23];
  uint64_t v24 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_26BF72F58, v12, objc_msgSend(v12, "length") / v9, v15, 5, 0, v22);

  v12 = (void *)v23;
LABEL_29:

  return v24;
}

+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:
{
  unsigned int v31 = [a3 hasInterleavedIndicesChannels];
  uint64_t v30 = [a3 indicesChannelCount];
  uint64_t v9 = [a3 bytesPerIndex];
  uint64_t v10 = [a3 primitiveCount];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "data"), "length");
  {
    +[MDLSubmesh(SCNModelIO) newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:]::defaultAllocator = objc_opt_new();
  }
  if (a4) {
    uint64_t v12 = a4;
  }
  else {
    uint64_t v12 = +[MDLSubmesh(SCNModelIO) newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:]::defaultAllocator;
  }
  uint64_t v13 = [a3 bytesPerIndex];
  uint64_t v14 = 32;
  if (v13 == 2) {
    uint64_t v14 = 16;
  }
  if (v13 == 1) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = v14;
  }
  if ([a3 primitiveType] == 1) {
    return objc_msgSend(a1, "newSubmeshWithGeometryData:indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:", objc_msgSend(a3, "data"), v11, v31, v30, a5, v9, v15, 3, v12, objc_msgSend(a3, "primitiveCount") + 2, 0);
  }
  if ([a3 primitiveType] == 4)
  {
    uint64_t v29 = a5;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "data"), "bytes");
    v18 = (void *)[MEMORY[0x263EFF990] dataWithLength:v10];
    uint64_t v19 = [v18 mutableBytes];
    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        switch(v9)
        {
          case 1:
            LOBYTE(v21) = *(unsigned char *)(v17 + i);
            goto LABEL_20;
          case 2:
            LOWORD(v21) = *(_WORD *)(v17 + 2 * i);
            goto LABEL_20;
          case 4:
            LODWORD(v21) = *(_DWORD *)(v17 + 4 * i);
            goto LABEL_20;
          case 8:
            uint64_t v21 = *(void *)(v17 + 8 * i);
LABEL_20:
            *(unsigned char *)(v19 + i) = v21;
            break;
          default:
            continue;
        }
      }
    }
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "data"), "subdataWithRange:", v10 * v9, objc_msgSend((id)objc_msgSend(a3, "data"), "length") - v10 * v9);
    id v23 = objc_alloc_init(MEMORY[0x263F13670]);
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F13628]) initWithType:2 data:v18];
    [v23 setFaceCount:v10];
    [v23 setFaceTopology:v24];
    uint64_t v25 = [a1 newSubmeshWithGeometryData:v22 indexBufferLength:v11 interleaved:v31 channelCount:v30 channelIdx:v29 bytesPerIndex:v9 indexType:v15 geometryType:5 allocator:v12 indexCount:0 topology:v23];

    return v25;
  }
  else
  {
    unint64_t v26 = [a3 primitiveType];
    if (v26 > 3)
    {
      uint64_t v28 = 0;
      uint64_t v27 = 1;
    }
    else
    {
      uint64_t v27 = qword_20B5CB720[v26];
      uint64_t v28 = qword_20B5CB740[v26];
    }
    return objc_msgSend(a1, "newSubmeshWithGeometryData:indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:", objc_msgSend(a3, "data"), v11, v31, v30, a5, v9, v15, v28, v12, objc_msgSend(a3, "primitiveCount") * v27, 0);
  }
}

@end