@interface PHFaceGroup(PNFaceGroupProtocol)
- (BOOL)isDirty;
- (uint64_t)faceCountInFaceGroup;
@end

@implementation PHFaceGroup(PNFaceGroupProtocol)

- (uint64_t)faceCountInFaceGroup
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v7[0] = *MEMORY[0x1E4F39630];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 setFetchPropertySets:v3];

  [v2 setShouldPrefetchCount:1];
  [v2 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v2 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  v4 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:a1 options:v2];
  uint64_t v5 = [v4 count];

  return v5;
}

- (BOOL)isDirty
{
  v2 = objc_opt_new();
  [v2 setShouldPrefetchCount:1];
  [v2 setIncludeTorsoOnlyPerson:1];
  v3 = [MEMORY[0x1E4F391F8] fetchPersonAssociatedWithFaceGroup:a1 options:v2];
  BOOL v4 = [v3 count] != 1;

  return v4;
}

@end