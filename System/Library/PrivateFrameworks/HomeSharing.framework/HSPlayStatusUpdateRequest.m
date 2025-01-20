@interface HSPlayStatusUpdateRequest
- (BOOL)isConcurrent;
- (HSPlayStatusUpdateRequest)initWithInterfaceID:(unsigned int)a3 revisionID:(unsigned int)a4;
- (double)timeoutInterval;
- (id)canonicalResponseForResponse:(id)a3;
- (unsigned)interfaceID;
- (unsigned)revisionID;
@end

@implementation HSPlayStatusUpdateRequest

- (unsigned)revisionID
{
  return self->_revisionID;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

- (double)timeoutInterval
{
  v2 = [MEMORY[0x263EFF910] distantFuture];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  return v4;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)canonicalResponseForResponse:(id)a3
{
  double v3 = +[HSResponse responseWithResponse:a3];
  double v4 = [v3 responseData];
  v5 = +[HSResponseDataParser parseResponseData:v4];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v6 objectForKey:&unk_26C5EF2F8];
  objc_msgSend(v3, "setNextRevisionID:", objc_msgSend(v7, "unsignedIntValue"));

  v8 = [v6 objectForKey:&unk_26C5EF310];
  if ([v8 length] == 32)
  {
    v9 = (unsigned __int8 *)[v8 bytes];
    [v3 setNowPlayingDatabaseID:(((unint64_t)*v9 << 56) | ((unint64_t)v9[1] << 48) | ((unint64_t)v9[2] << 40) | ((unint64_t)v9[3] << 32) | ((unint64_t)v9[4] << 24) | ((unint64_t)v9[5] << 16) | ((unint64_t)v9[6] << 8))+ v9[7]];
    [v3 setNowPlayingContainerID:(((unint64_t)v9[8] << 56) | ((unint64_t)v9[9] << 48) | ((unint64_t)v9[10] << 40) | ((unint64_t)v9[11] << 32) | ((unint64_t)v9[12] << 24) | ((unint64_t)v9[13] << 16) | ((unint64_t)v9[14] << 8))+ v9[15]];
    [v3 setNowPlayingContainerItemID:(((unint64_t)v9[16] << 56) | ((unint64_t)v9[17] << 48) | ((unint64_t)v9[18] << 40) | ((unint64_t)v9[19] << 32) | ((unint64_t)v9[20] << 24) | ((unint64_t)v9[21] << 16) | ((unint64_t)v9[22] << 8))+ v9[23]];
    [v3 setNowPlayingItemID:(((unint64_t)v9[24] << 56) | ((unint64_t)v9[25] << 48) | ((unint64_t)v9[26] << 40) | ((unint64_t)v9[27] << 32) | ((unint64_t)v9[28] << 24) | ((unint64_t)v9[29] << 16) | ((unint64_t)v9[30] << 8))+ v9[31]];
  }
  else
  {
    v10 = [v6 objectForKey:&unk_26C5EF328];
    if ([v10 length] == 16)
    {
      v11 = (unsigned int *)[v8 bytes];
      [v3 setNowPlayingDatabaseID:bswap32(*v11)];
      [v3 setNowPlayingContainerID:bswap32(v11[1])];
      [v3 setNowPlayingContainerItemID:bswap32(v11[2])];
      [v3 setNowPlayingItemID:bswap32(v11[3])];
    }
  }
  [v3 setPlayStatusInformation:v6];

  return v3;
}

- (HSPlayStatusUpdateRequest)initWithInterfaceID:(unsigned int)a3 revisionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%u/%s", "ctrl-int", *(void *)&a3, "playstatusupdate");
  v8 = [(HSRequest *)self initWithAction:v7];

  if (v8)
  {
    v8->_interfaceID = a3;
    v8->_revisionID = v4;
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v4);
    [(HSRequest *)v8 setValue:v9 forArgument:@"revision-number"];
  }
  return v8;
}

@end