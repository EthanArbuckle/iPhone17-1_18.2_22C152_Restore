@interface BMFrameStore(V2)
@end

@implementation BMFrameStore(V2)

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.2(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Frames file %{public}@ is invalid because the current size is less than a valid segment header.", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.3(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F4FB78];
  v2 = [a1 attributes];
  v3 = [v2 path];
  uint64_t v4 = [v1 privacyPathname:v3];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v5, v6, "Unable to read frames file segment header %{public}@ error %{darwin.errno}d.", v7, v8, v9, v10, v11);
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.4(_DWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = *a1;
  uint64_t v6 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v7 = [a2 attributes];
  uint64_t v8 = [v7 path];
  uint64_t v9 = [v6 privacyPathname:v8];
  v10[0] = 68290050;
  v10[1] = 4;
  __int16 v11 = 2082;
  v12 = a1;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 2114;
  v16 = v9;
  __int16 v17 = 1042;
  int v18 = 4;
  __int16 v19 = 2082;
  v20 = "SEGB";
  _os_log_error_impl(&dword_1AD076000, a3, OS_LOG_TYPE_ERROR, "Segment header magic '%{public}.4s' (0x%04X) in file %{public}@ doesn't match expected magic '%{public}.4s'.", (uint8_t *)v10, 0x32u);
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.5(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v4, v5, "Unable to read frames file segment header %{public}@. Received data of %{public}d length.", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.6(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F4FB78];
  v2 = [a1 attributes];
  v3 = [v2 path];
  uint64_t v4 = [v1 privacyPathname:v3];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v5, v6, "Failed to fstat %{public}@ with error: %{darwin.errno}d", v7, v8, v9, v10, v11);
}

- (void)initWithFileHandleV2:()V2 permission:.cold.1(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F4FB78];
  v2 = [a1 backingFile];
  v3 = [v2 attributes];
  uint64_t v4 = [v3 path];
  uint64_t v5 = [v1 privacyPathname:v4];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v6, v7, "Not mapping an empty file %{public}@", v8, v9, v10, v11, v12);
}

- (void)initWithFileHandleV2:()V2 permission:.cold.2(void *a1)
{
  v2 = [a1 _printablePathV2];
  [a1 lastAbsoluteTimestamp];
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v3, v4, "Found a bad lastAbsoluteTimestamp in header for segment file %{public}@ time: %f", v5, v6, v7, v8, 2u);
}

- (void)initWithFileHandleV2:()V2 permission:.cold.3(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F4FB78];
  v2 = [a1 segmentPath];
  uint64_t v3 = [v1 privacyPathname:v2];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v4, v5, "Failed to map frames for %{public}@ with permission %lu", v6, v7, v8, v9, v10);
}

- (void)initWithFileHandleV2:()V2 permission:.cold.4(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F4FB78];
  v2 = [a1 backingFile];
  uint64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 path];
  uint64_t v5 = [v1 privacyPathname:v4];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v6, v7, "Failed to map header for %{public}@ with permission %lu", v8, v9, v10, v11, v12);
}

- (void)frameWithOffsetV2:()V2 expectedState:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "frameWithOffsetV2: offset is not 4-byte aligned:%zu", v1, 0xCu);
}

@end