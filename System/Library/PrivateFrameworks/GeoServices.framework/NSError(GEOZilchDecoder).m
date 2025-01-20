@interface NSError(GEOZilchDecoder)
+ (uint64_t)zilchDecoderErrorForNoSolution;
- (id)zilchDecoderTileLoadingError;
@end

@implementation NSError(GEOZilchDecoder)

+ (uint64_t)zilchDecoderErrorForNoSolution
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"GEOZilchDecoderErrorDomain" code:2 userInfo:0];
}

- (id)zilchDecoderTileLoadingError
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 domain];
  v3 = GEOErrorDomain();
  if ([v2 isEqualToString:v3])
  {
    GEOStringForError((__CFString *)[a1 code]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"Unknown tile loading error";
  }

  uint64_t v5 = *MEMORY[0x1E4F28568];
  v9[0] = *MEMORY[0x1E4F28A50];
  v9[1] = v5;
  v10[0] = a1;
  v10[1] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GEOZilchDecoderErrorDomain" code:1 userInfo:v6];

  return v7;
}

@end