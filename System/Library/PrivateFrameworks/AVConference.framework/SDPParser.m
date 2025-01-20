@interface SDPParser
- (BOOL)nextLine;
- (BOOL)parseMediaLineHeader:(id)a3 mediaType:(int *)a4 supportedPayloads:(id)a5 rtpPort:(int *)a6;
- (BOOL)parsingDone;
- (NSString)fieldName;
- (NSString)fieldValue;
- (SDPParser)initWithString:(id)a3;
- (int)stringToMediaType:(id)a3;
- (unsigned)fieldType;
- (void)dealloc;
@end

@implementation SDPParser

- (SDPParser)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SDPParser;
  v4 = [(SDPParser *)&v7 init];
  if (v4)
  {
    v5 = (NSArray *)(id)[a3 componentsSeparatedByString:@"\r\n"];
    v4->_lines = v5;
    v4->_lineEnumerator = [(NSArray *)v5 objectEnumerator];
    v4->_fieldNameMap = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC6EA0, @"a", &unk_1F3DC6EB8, @"i", &unk_1F3DC6ED0, @"c", &unk_1F3DC6EE8, @"b", &unk_1F3DC6F00, @"k", &unk_1F3DC6F18, @"v", &unk_1F3DC6F30, @"m", &unk_1F3DC6F48, @"o", &unk_1F3DC6F60,
                                          @"s",
                                          &unk_1F3DC6F78,
                                          @"u",
                                          &unk_1F3DC6F90,
                                          @"e",
                                          &unk_1F3DC6FA8,
                                          @"p",
                                          &unk_1F3DC6FC0,
                                          @"t",
                                          &unk_1F3DC6FD8,
                                          @"r",
                                          &unk_1F3DC6FF0,
                                          @"z",
                                          0);
    [(SDPParser *)v4 nextLine];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)SDPParser;
  [(SDPParser *)&v3 dealloc];
}

- (int)stringToMediaType:(id)a3
{
  if ([a3 isEqualToString:@"audio"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"video"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"screen"]) {
    return 3;
  }
  return -1;
}

- (BOOL)nextLine
{
  id v3 = [(NSEnumerator *)self->_lineEnumerator nextObject];
  if (!v3) {
    self->_parsingDone = 1;
  }
  uint64_t v4 = (void *)[v3 componentsSeparatedByString:@"="];
  self->_fieldName = (NSString *)[v4 objectAtIndexedSubscript:0];
  if ((unint64_t)[v4 count] < 2) {
    v5 = &stru_1F3D3E450;
  }
  else {
    v5 = (__CFString *)objc_msgSend((id)objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1), "componentsJoinedByString:", @"=");
  }
  self->_fieldValue = &v5->isa;
  id v6 = [(NSDictionary *)self->_fieldNameMap objectForKeyedSubscript:self->_fieldName];
  if (v6) {
    int v7 = [v6 unsignedCharValue];
  }
  else {
    int v7 = 255;
  }
  self->_fieldType = v7;
  return v7 != 255;
}

- (BOOL)parseMediaLineHeader:(id)a3 mediaType:(int *)a4 supportedPayloads:(id)a5 rtpPort:(int *)a6
{
  v10 = (void *)[a3 componentsSeparatedByString:@" "];
  if (!a4 || !a5 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:]();
      }
    }
    return 0;
  }
  v11 = v10;
  if ((unint64_t)[v10 count] <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:]();
      }
    }
    return 0;
  }
  int v12 = -[SDPParser stringToMediaType:](self, "stringToMediaType:", [v11 objectAtIndexedSubscript:0]);
  *a4 = v12;
  if (v12 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:]();
      }
    }
    return 0;
  }
  BOOL v13 = 1;
  *a6 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", 1), "intValue");
  if ((unint64_t)[v11 count] >= 4)
  {
    unint64_t v14 = 3;
    do
      objc_msgSend(a5, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v14++), "intValue")));
    while (v14 < [v11 count]);
    return 1;
  }
  return v13;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (BOOL)parsingDone
{
  return self->_parsingDone;
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameters passed to parseMediaLineHeader", v2, v3, v4, v5, v6);
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Corrupted media line header", v2, v3, v4, v5, v6);
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to match the media line type", v2, v3, v4, v5, v6);
}

@end