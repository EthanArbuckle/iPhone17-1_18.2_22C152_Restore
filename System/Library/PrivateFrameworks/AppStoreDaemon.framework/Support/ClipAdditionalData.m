@interface ClipAdditionalData
- (id)description;
@end

@implementation ClipAdditionalData

- (id)description
{
  archiveSize = self->_archiveSize;
  digestChunk = self->_digestChunk;
  if (!archiveSize) {
    archiveSize = (NSNumber *)@"<null>";
  }
  v19[0] = @"archiveSize";
  v19[1] = @"uncompressedSize";
  uncompressedSize = self->_uncompressedSize;
  if (!uncompressedSize) {
    uncompressedSize = (NSNumber *)@"<null>";
  }
  v20[0] = archiveSize;
  v20[1] = uncompressedSize;
  v19[2] = @"digest";
  if (digestChunk) {
    CFStringRef v6 = (const __CFString *)digestChunk;
  }
  else {
    CFStringRef v6 = @"<null>";
  }
  v17[0] = @"chunk";
  v17[1] = @"hashes";
  digestHashes = self->_digestHashes;
  if (!digestHashes) {
    digestHashes = (NSArray *)@"<null>";
  }
  v18[0] = v6;
  v18[1] = digestHashes;
  v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v19[3] = @"sinfs";
  v20[2] = v8;
  v15[0] = @"sinf";
  v15[1] = @"dpinfo";
  sinf = self->_sinf;
  if (!sinf) {
    sinf = (NSData *)@"<null>";
  }
  dpInfo = self->_dpInfo;
  if (!dpInfo) {
    dpInfo = (NSData *)@"<null>";
  }
  v16[0] = sinf;
  v16[1] = dpInfo;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v20[3] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v13 = [v12 description];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedSize, 0);
  objc_storeStrong((id *)&self->_sinf, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_digestHashes, 0);
  objc_storeStrong((id *)&self->_digestChunk, 0);
  objc_storeStrong((id *)&self->_archiveSize, 0);
}

@end