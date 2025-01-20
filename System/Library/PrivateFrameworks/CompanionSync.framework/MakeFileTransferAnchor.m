@interface MakeFileTransferAnchor
@end

@implementation MakeFileTransferAnchor

void ___MakeFileTransferAnchor_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MakeFileTransferAnchor___formatter;
  _MakeFileTransferAnchor___formatter = v0;

  [(id)_MakeFileTransferAnchor___formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
  id v2 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [(id)_MakeFileTransferAnchor___formatter setTimeZone:v2];
}

@end