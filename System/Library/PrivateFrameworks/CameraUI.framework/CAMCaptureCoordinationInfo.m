@interface CAMCaptureCoordinationInfo
- (BOOL)isEV0ForHDREV0Pair;
- (BOOL)isFiltered;
- (BOOL)isFilteredImageForFilteredPair;
- (BOOL)isFinalExpectedStillImageResult;
- (BOOL)isFinalExpectedVideoResult;
- (BOOL)isHDR;
- (BOOL)isHDRForHDREV0Pair;
- (BOOL)isUnfilteredImageForFilteredPair;
- (BOOL)representsFinalProcessedStillImage;
- (BOOL)representsFinalProcessedVideo;
- (CAMCaptureCoordinationInfo)initWithIdentifier:(id)a3 allExpectedResultSpecifiers:(id)a4 resultSpecifiers:(unint64_t)a5;
- (NSSet)allExpectedResultSpecifiers;
- (NSString)identifier;
- (id)description;
- (unint64_t)resultSpecifiers;
@end

@implementation CAMCaptureCoordinationInfo

- (CAMCaptureCoordinationInfo)initWithIdentifier:(id)a3 allExpectedResultSpecifiers:(id)a4 resultSpecifiers:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CAMCaptureCoordinationInfo;
  v10 = [(CAMCaptureCoordinationInfo *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    allExpectedResultSpecifiers = v10->_allExpectedResultSpecifiers;
    v10->_allExpectedResultSpecifiers = (NSSet *)v13;

    v10->_resultSpecifiers = a5;
    v15 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CAMCaptureCoordinationInfo;
  v4 = [(CAMCaptureCoordinationInfo *)&v13 description];
  char v5 = [(CAMCaptureCoordinationInfo *)self resultSpecifiers];
  char v6 = v5;
  if ((v5 & 2) != 0)
  {
    v7 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v7 = &stru_26BD78BA0;
  if (v5)
  {
LABEL_5:
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@"HDR"];

    v7 = (__CFString *)v8;
  }
LABEL_6:
  if (![(__CFString *)v7 length])
  {

    v7 = @"None";
  }
  id v9 = [(CAMCaptureCoordinationInfo *)self allExpectedResultSpecifiers];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke;
  v14[3] = &unk_263FA1428;
  v14[4] = &v15;
  [v9 enumerateObjectsUsingBlock:v14];
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  uint64_t v11 = [v3 stringWithFormat:@"%@: %@ (of %@)", v4, v7, v10];

  return v11;
}

- (BOOL)isHDR
{
  return [(CAMCaptureCoordinationInfo *)self resultSpecifiers] & 1;
}

- (BOOL)isFiltered
{
  return ([(CAMCaptureCoordinationInfo *)self resultSpecifiers] >> 1) & 1;
}

- (BOOL)isUnfilteredImageForFilteredPair
{
  v3 = [(CAMCaptureCoordinationInfo *)self allExpectedResultSpecifiers];
  unint64_t v4 = [(CAMCaptureCoordinationInfo *)self resultSpecifiers];
  if (v4 == (v4 | 2))
  {
    char v5 = 0;
  }
  else
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    char v5 = [v3 containsObject:v6];
  }
  return v5;
}

- (BOOL)isFilteredImageForFilteredPair
{
  v3 = [(CAMCaptureCoordinationInfo *)self allExpectedResultSpecifiers];
  unint64_t v4 = [(CAMCaptureCoordinationInfo *)self resultSpecifiers];
  if (v4 == (v4 & 0xFFFFFFFFFFFFFFFDLL))
  {
    char v5 = 0;
  }
  else
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    char v5 = [v3 containsObject:v6];
  }
  return v5;
}

- (BOOL)isEV0ForHDREV0Pair
{
  v3 = [(CAMCaptureCoordinationInfo *)self allExpectedResultSpecifiers];
  unint64_t v4 = [(CAMCaptureCoordinationInfo *)self resultSpecifiers];
  if (v4 == (v4 | 1))
  {
    char v5 = 0;
  }
  else
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    char v5 = [v3 containsObject:v6];
  }
  return v5;
}

- (BOOL)isHDRForHDREV0Pair
{
  v3 = [(CAMCaptureCoordinationInfo *)self allExpectedResultSpecifiers];
  unint64_t v4 = [(CAMCaptureCoordinationInfo *)self resultSpecifiers];
  if (v4 == (v4 & 0xFFFFFFFFFFFFFFFELL))
  {
    char v5 = 0;
  }
  else
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    char v5 = [v3 containsObject:v6];
  }
  return v5;
}

- (BOOL)isFinalExpectedStillImageResult
{
  if ([(CAMCaptureCoordinationInfo *)self isEV0ForHDREV0Pair]) {
    return 0;
  }
  else {
    return ![(CAMCaptureCoordinationInfo *)self isUnfilteredImageForFilteredPair];
  }
}

- (BOOL)isFinalExpectedVideoResult
{
  return ![(CAMCaptureCoordinationInfo *)self isEV0ForHDREV0Pair];
}

- (BOOL)representsFinalProcessedStillImage
{
  if ([(CAMCaptureCoordinationInfo *)self isEV0ForHDREV0Pair]) {
    return 0;
  }
  else {
    return ![(CAMCaptureCoordinationInfo *)self isUnfilteredImageForFilteredPair];
  }
}

- (BOOL)representsFinalProcessedVideo
{
  return ![(CAMCaptureCoordinationInfo *)self isEV0ForHDREV0Pair];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allExpectedResultSpecifiers
{
  return self->_allExpectedResultSpecifiers;
}

- (unint64_t)resultSpecifiers
{
  return self->_resultSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExpectedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end