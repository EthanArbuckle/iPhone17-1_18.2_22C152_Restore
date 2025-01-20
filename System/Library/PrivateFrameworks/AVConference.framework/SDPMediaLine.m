@interface SDPMediaLine
+ (void)fillImageArray:(id)a3 imageArray:(imageTag *)a4;
+ (void)fillImageStruct:(id)a3 imageStruct:(imageTag *)a4;
+ (void)fillImageStructWithDictionary:(id)a3 forInterface:(int)a4 imageStruct:(imageTag *)a5;
- (BOOL)allowRTCPFB;
- (BOOL)supportImage:(id)a3 width:(int)a4 height:(int)a5 rate:(int)a6;
- (BOOL)videoDisplayAttribute:(int *)a3 withHeight:(int *)a4;
- (NSArray)attributes;
- (NSArray)payloads;
- (NSString)string;
- (SDPMediaLine)init;
- (SDPMediaLine)initWithParser:(id)a3 rtpPort:(int)a4 payloads:(id)a5;
- (VCImageAttributeRules)imageAttributeRules;
- (id)getVideoRecvImages:(id)a3;
- (id)getVideoSendImages:(id)a3;
- (id)videoImageAttributes:(int)a3;
- (int)rtcpPort;
- (int)rtpPort;
- (unsigned)rtpId;
- (void)addAttribute:(id)a3;
- (void)addImageAttributeRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 direction:(int)a6 attributeString:(id)a7;
- (void)addPayload:(int)a3 rtpMap:(id)a4 formatParameters:(id)a5;
- (void)addVideoImageAttr:(id)a3 ForPayload:(int)a4;
- (void)addWifiRules:(id)a3 cellularRules:(id)a4 payload:(int)a5 direction:(int)a6;
- (void)appendPayload:(int)a3 dimensions:(imageTag *)a4 direction:(int)a5 attributeString:(id)a6;
- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6;
- (void)dealloc;
- (void)parseAttribute:(id)a3;
- (void)parseImageAttributeRules:(id)a3;
- (void)parseMediaLine:(id)a3;
- (void)setImageAttributeRules:(id)a3;
- (void)setRtpId:(unsigned int)a3;
@end

@implementation SDPMediaLine

- (SDPMediaLine)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)SDPMediaLine;
  v2 = [(SDPMediaLine *)&v4 init];
  if (v2)
  {
    v2->_attributes = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    v2->_imageAttributeRules = (VCImageAttributeRules *)objc_opt_new();
    v2->_payloads = (NSMutableArray *)objc_opt_new();
  }
  return v2;
}

- (SDPMediaLine)initWithParser:(id)a3 rtpPort:(int)a4 payloads:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SDPMediaLine;
  v8 = [(SDPMediaLine *)&v10 init];
  if (v8)
  {
    v8->_attributes = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    v8->_imageAttributeRules = (VCImageAttributeRules *)objc_opt_new();
    v8->_payloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a5];
    v8->_rtpPort = a4;
    [(SDPMediaLine *)v8 parseMediaLine:a3];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)SDPMediaLine;
  [(SDPMediaLine *)&v3 dealloc];
}

- (void)addAttribute:(id)a3
{
}

- (void)addPayload:(int)a3 rtpMap:(id)a4 formatParameters:(id)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  if ((-[NSMutableArray containsObject:](self->_payloads, "containsObject:") & 1) == 0) {
    [(NSMutableArray *)self->_payloads addObject:v8];
  }
  if (([(NSMutableArray *)self->_attributes containsObject:a4] & 1) == 0)
  {
    [(NSMutableArray *)self->_attributes addObject:a4];
    [(NSMutableArray *)self->_attributes addObject:a5];
  }
}

- (void)addVideoImageAttr:(id)a3 ForPayload:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"imageattr:%d", *(void *)&a4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  attributes = self->_attributes;
  uint64_t v8 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(attributes);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 hasPrefix:v6])
        {
          -[NSMutableArray addObject:](self->_attributes, "addObject:", [v12 stringByAppendingFormat:@" %@", a3]);
          [(NSMutableArray *)self->_attributes removeObject:v12];
          return;
        }
      }
      uint64_t v9 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  -[NSMutableArray addObject:](self->_attributes, "addObject:", [NSString stringWithFormat:@"%@ %@", v6, a3]);
}

- (void)appendPayload:(int)a3 dimensions:(imageTag *)a4 direction:(int)a5 attributeString:(id)a6
{
  uint64_t var0 = a4->var0;
  if (a4->var3 * var0 * a4->var6)
  {
    uint64_t v8 = *(void *)&a5;
    uint64_t v10 = *(void *)&a3;
    uint64_t var2 = a4->var2;
    if (var0 == var2) {
      objc_msgSend(a6, "appendFormat:", @" [x=%d,", a4->var0, v17, v19);
    }
    else {
      objc_msgSend(a6, "appendFormat:", @" [x=[%d:%d:%d],", var0, a4->var1, var2);
    }
    uint64_t var3 = a4->var3;
    uint64_t var5 = a4->var5;
    if (var3 == var5) {
      objc_msgSend(a6, "appendFormat:", @"y=%d,", a4->var3, v18, v20);
    }
    else {
      objc_msgSend(a6, "appendFormat:", @"y=[%d:%d:%d],", var3, a4->var4, var5);
    }
    objc_msgSend(a6, "appendFormat:", @"fps=%d", a4->var6);
    if (a4->var8 == 1) {
      [a6 appendString:@",i=1"];
    }
    float var7 = a4->var7;
    if (var7 == 0.5) {
      [a6 appendString:@"]"];
    }
    else {
      [a6 appendFormat:@",q=%.2f]", var7];
    }
    LODWORD(v16) = a4->var8;
    [(VCImageAttributeRules *)self->_imageAttributeRules addRuleForVideoPayload:v10 withDirection:v8 width:a4->var2 height:a4->var5 frameRate:a4->var6 priority:(int)a4->var7 interface:v16];
  }
}

- (void)addImageAttributeRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 direction:(int)a6 attributeString:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(v21, 170, sizeof(v21));
  uint64_t v22 = -1431655766;
  if (a4 == 1) {
    int v12 = 2;
  }
  else {
    int v12 = 1;
  }
  int v23 = v12;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(a3);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        LODWORD(v21[1]) = [v17 iWidth];
        LODWORD(v21[0]) = v21[1];
        int v18 = [v17 iHeight];
        LODWORD(v21[2]) = 0;
        HIDWORD(v21[2]) = v18;
        HIDWORD(v21[1]) = v18;
        HIDWORD(v21[0]) = 0;
        [v17 fPref];
        HIDWORD(v22) = v19;
        [v17 fRate];
        LODWORD(v22) = (int)v20;
        [(SDPMediaLine *)self appendPayload:v9 dimensions:v21 direction:v8 attributeString:a7];
      }
      uint64_t v14 = [a3 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)addWifiRules:(id)a3 cellularRules:(id)a4 payload:(int)a5 direction:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  if (a3 && [a3 count] || a4 && objc_msgSend(a4, "count"))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
    if (v6) {
      int v12 = @"recv";
    }
    else {
      int v12 = @"send";
    }
    id v13 = (id)[v11 initWithString:v12];
    if (a3 && [a3 count]) {
      [(SDPMediaLine *)self addImageAttributeRules:a3 transportType:1 payload:v7 direction:v6 attributeString:v13];
    }
    if (a4 && [a4 count]) {
      [(SDPMediaLine *)self addImageAttributeRules:a4 transportType:2 payload:v7 direction:v6 attributeString:v13];
    }
    [(SDPMediaLine *)self addVideoImageAttr:v13 ForPayload:v7];
  }
}

- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6
{
  if (a5)
  {
    LODWORD(v6) = a6;
    if (a6 >= 1)
    {
      uint64_t v7 = a5;
      uint64_t v8 = *(void *)&a4;
      uint64_t v9 = *(void *)&a3;
      id v11 = "recv";
      if (!a4) {
        id v11 = "send";
      }
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%s", v11);
      uint64_t v6 = v6;
      do
      {
        [(SDPMediaLine *)self appendPayload:v9 dimensions:v7++ direction:v8 attributeString:v12];
        --v6;
      }
      while (v6);
      [(SDPMediaLine *)self addVideoImageAttr:v12 ForPayload:v9];
    }
  }
}

- (id)videoImageAttributes:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"imageattr:%d", *(void *)&a3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  attributes = self->_attributes;
  uint64_t v7 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(attributes);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 hasPrefix:v4])
        {
          uint64_t v12 = (void *)[v11 componentsSeparatedByString:@" "];
          if ((int)[v12 count] >= 2)
          {
            uint64_t v13 = 1;
            do
              objc_msgSend(v5, "addObject:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13++));
            while (v13 < (int)[v12 count]);
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)getVideoSendImages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  objc_super v3 = (void *)[a3 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    id v7 = 0;
    *(void *)&long long v5 = 136315650;
    long long v15 = v5;
    do
    {
      if (objc_msgSend(v6, "isEqualToString:", @"send", v15))
      {
        if (v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            uint64_t v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              uint64_t v17 = v12;
              __int16 v18 = 2080;
              long long v19 = "-[SDPMediaLine getVideoSendImages:]";
              __int16 v20 = 1024;
              int v21 = 228;
              _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d multiple send markers found!", buf, 0x1Cu);
            }
          }
        }
        else
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
      }
      else if ([v6 isEqualToString:@"recv"])
      {
        if (v7) {
          return v7;
        }
      }
      else if (v7 {
             && [v6 hasPrefix:@"["]
      }
             && ([v6 hasSuffix:@"]"] & 1) != 0)
      {
        uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1), "substringFromIndex:", 1);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v10 = (void *)[v8 componentsSeparatedByString:@","];
        if ((int)[v10 count] >= 1)
        {
          uint64_t v11 = 0;
          do
            objc_msgSend(v9, "addObject:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11++));
          while (v11 < (int)[v10 count]);
        }
        [v7 addObject:v9];
      }
      uint64_t v6 = (void *)[v3 nextObject];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)getVideoRecvImages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  objc_super v3 = (void *)[a3 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    id v7 = 0;
    *(void *)&long long v5 = 136315650;
    long long v15 = v5;
    do
    {
      if (objc_msgSend(v6, "isEqualToString:", @"recv", v15))
      {
        if (v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            uint64_t v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              uint64_t v17 = v12;
              __int16 v18 = 2080;
              long long v19 = "-[SDPMediaLine getVideoRecvImages:]";
              __int16 v20 = 1024;
              int v21 = 271;
              _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d multiple recv markers found!", buf, 0x1Cu);
            }
          }
        }
        else
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
      }
      else if ([v6 isEqualToString:@"send"])
      {
        if (v7) {
          return v7;
        }
      }
      else if (v7 {
             && [v6 hasPrefix:@"["]
      }
             && ([v6 hasSuffix:@"]"] & 1) != 0)
      {
        uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1), "substringFromIndex:", 1);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v10 = (void *)[v8 componentsSeparatedByString:@","];
        if ((int)[v10 count] >= 1)
        {
          uint64_t v11 = 0;
          do
            objc_msgSend(v9, "addObject:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11++));
          while (v11 < (int)[v10 count]);
        }
        [v7 addObject:v9];
      }
      uint64_t v6 = (void *)[v3 nextObject];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (void)fillImageStructWithDictionary:(id)a3 forInterface:(int)a4 imageStruct:(imageTag *)a5
{
  if ([a3 objectForKeyedSubscript:@"width"]
    && [a3 objectForKeyedSubscript:@"height"]
    && [a3 objectForKeyedSubscript:@"frameRate"])
  {
    if ([a3 objectForKeyedSubscript:@"priority"])
    {
      int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"width"), "intValue");
      a5->uint64_t var0 = v8;
      a5->var1 = 0;
      a5->uint64_t var2 = v8;
      int v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"height"), "intValue");
      a5->uint64_t var3 = v9;
      a5->var4 = 0;
      a5->uint64_t var5 = v9;
      a5->var6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"frameRate"), "intValue");
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"priority"), "floatValue");
      a5->float var7 = v10;
      a5->var8 = a4;
    }
  }
}

+ (void)fillImageStruct:(id)a3 imageStruct:(imageTag *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *(void *)&a4->float var7 = 0x23F000000;
    long long v5 = (void *)[a3 objectEnumerator];
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      id v7 = (void *)v6;
      do
      {
        if ([v7 hasPrefix:@"x=["])
        {
          int v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1), "substringFromIndex:", 3), "componentsSeparatedByString:", @":");
          if ([v8 count] == 3)
          {
            a4->uint64_t var0 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "intValue");
            a4->var1 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue");
            unsigned int v9 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 2), "intValue");
LABEL_9:
            a4->uint64_t var2 = v9;
          }
        }
        else
        {
          if ([v7 hasPrefix:@"x="])
          {
            unsigned int v9 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
            *(void *)&a4->uint64_t var0 = v9;
            goto LABEL_9;
          }
          if (![v7 hasPrefix:@"y=["])
          {
            if (![v7 hasPrefix:@"y="])
            {
              if ([v7 hasPrefix:@"fps="])
              {
                a4->var6 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 4), "intValue");
              }
              else if ([v7 hasPrefix:@"q="])
              {
                objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "floatValue");
                a4->float var7 = v12;
              }
              else if ([v7 hasPrefix:@"i="])
              {
                a4->var8 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                uint64_t v13 = *MEMORY[0x1E4F47A50];
                uint64_t v14 = *MEMORY[0x1E4F47A50];
                if (*MEMORY[0x1E4F47A40])
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v15 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
                    *(_DWORD *)buf = 136315906;
                    uint64_t v19 = v17;
                    __int16 v20 = 2080;
                    int v21 = "+[SDPMediaLine fillImageStruct:imageStruct:]";
                    __int16 v22 = 1024;
                    int v23 = 369;
                    __int16 v24 = 2080;
                    uint64_t v25 = v15;
                    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v16 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
                  *(_DWORD *)buf = 136315906;
                  uint64_t v19 = v17;
                  __int16 v20 = 2080;
                  int v21 = "+[SDPMediaLine fillImageStruct:imageStruct:]";
                  __int16 v22 = 1024;
                  int v23 = 369;
                  __int16 v24 = 2080;
                  uint64_t v25 = v16;
                  _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                }
              }
              goto LABEL_10;
            }
            unsigned int v11 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
            *(void *)&a4->uint64_t var3 = v11;
            goto LABEL_17;
          }
          float v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1), "substringFromIndex:", 3), "componentsSeparatedByString:", @":");
          if ([v10 count] == 3)
          {
            a4->uint64_t var3 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "intValue");
            a4->var4 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue");
            unsigned int v11 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 2), "intValue");
LABEL_17:
            a4->uint64_t var5 = v11;
          }
        }
LABEL_10:
        id v7 = (void *)[v5 nextObject];
      }
      while (v7);
    }
  }
}

+ (void)fillImageArray:(id)a3 imageArray:(imageTag *)a4
{
  if (a3 && (int)[a3 count] >= 1)
  {
    uint64_t v7 = 0;
    do
      objc_msgSend(a1, "fillImageStruct:imageStruct:", objc_msgSend(a3, "objectAtIndexedSubscript:", v7++), a4++);
    while (v7 < (int)[a3 count]);
  }
}

- (BOOL)supportImage:(id)a3 width:(int)a4 height:(int)a5 rate:(int)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  +[SDPMediaLine fillImageStruct:a3 imageStruct:&v14];
  BOOL v9 = 0;
  if (a4 >= (int)v14 && SDWORD2(v14) >= a4)
  {
    if (DWORD1(v14)) {
      BOOL v9 = (a4 - (int)v14) % SDWORD1(v14) == 0;
    }
    else {
      BOOL v9 = 1;
    }
  }
  if (a5 < SHIDWORD(v14) || SDWORD1(v15) < a5)
  {
    BOOL v12 = 0;
    if (v9) {
      return SDWORD2(v15) >= a6 && v12;
    }
    return 0;
  }
  if (v15)
  {
    BOOL v12 = (a5 - HIDWORD(v14)) % (int)v15 == 0;
    if (v9) {
      return SDWORD2(v15) >= a6 && v12;
    }
    return 0;
  }
  BOOL v12 = 1;
  if (!v9) {
    return 0;
  }
  return SDWORD2(v15) >= a6 && v12;
}

- (BOOL)videoDisplayAttribute:(int *)a3 withHeight:(int *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [NSString stringWithFormat:@"ftdisplayattr:resolution"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  attributes = self->_attributes;
  uint64_t v8 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v8;
  BOOL v11 = 0;
  uint64_t v12 = *(void *)v39;
  *(void *)&long long v9 = 136315906;
  long long v26 = v9;
  long long v27 = attributes;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v39 != v12) {
        objc_enumerationMutation(attributes);
      }
      long long v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      if (objc_msgSend(v14, "hasPrefix:", v6, v26))
      {
        long long v15 = (void *)[v14 componentsSeparatedByString:@"["];
        if ([v15 count] == 2)
        {
          int v16 = (void *)[v15 objectAtIndexedSubscript:1];
          if ([v16 hasSuffix:@"]"])
          {
            uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1), "componentsSeparatedByString:", @","), "objectEnumerator");
            uint64_t v18 = [v17 nextObject];
            if (v18)
            {
              uint64_t v19 = (void *)v18;
              do
              {
                if ([v19 hasPrefix:@"x="])
                {
                  *a3 = objc_msgSend((id)objc_msgSend(v19, "substringFromIndex:", 2), "intValue");
                }
                else if ([v19 hasPrefix:@"y="])
                {
                  *a4 = objc_msgSend((id)objc_msgSend(v19, "substringFromIndex:", 2), "intValue");
                }
                else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
                {
                  uint64_t v20 = VRTraceErrorLogLevelToCSTR();
                  int v21 = *MEMORY[0x1E4F47A50];
                  __int16 v22 = *MEMORY[0x1E4F47A50];
                  if (*MEMORY[0x1E4F47A40])
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v23 = objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String");
                      *(_DWORD *)buf = v26;
                      uint64_t v30 = v20;
                      __int16 v31 = 2080;
                      v32 = "-[SDPMediaLine videoDisplayAttribute:withHeight:]";
                      __int16 v33 = 1024;
                      int v34 = 433;
                      __int16 v35 = 2080;
                      uint64_t v36 = v23;
                      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v24 = objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String");
                    *(_DWORD *)buf = v26;
                    uint64_t v30 = v20;
                    __int16 v31 = 2080;
                    v32 = "-[SDPMediaLine videoDisplayAttribute:withHeight:]";
                    __int16 v33 = 1024;
                    int v34 = 433;
                    __int16 v35 = 2080;
                    uint64_t v36 = v24;
                    _os_log_debug_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                  }
                }
                uint64_t v19 = (void *)[v17 nextObject];
              }
              while (v19);
            }
            BOOL v11 = 1;
            attributes = v27;
          }
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v38 objects:v37 count:16];
  }
  while (v10);
  return v11;
}

- (void)parseImageAttributeRules:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_payloads;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v6 = -[SDPMediaLine getVideoSendImages:](self, "getVideoSendImages:", -[SDPMediaLine videoImageAttributes:](self, "videoImageAttributes:", [v5 intValue]));
        if ((int)[v6 count] >= 1)
        {
          uint64_t v7 = 0;
          do
          {
            memset(v18, 170, sizeof(v18));
            uint64_t v19 = -1431655766;
            int v20 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", [v6 objectAtIndexedSubscript:v7], v18);
            imageAttributeRules = self->_imageAttributeRules;
            uint64_t v9 = [v5 intValue];
            LODWORD(v14) = v20;
            [(VCImageAttributeRules *)imageAttributeRules addRuleForVideoPayload:v9 withDirection:0 width:LODWORD(v18[1]) height:HIDWORD(v18[2]) frameRate:v19 priority:(int)*((float *)&v19 + 1) interface:v14];
            ++v7;
          }
          while (v7 < (int)[v6 count]);
        }
        id v10 = -[SDPMediaLine getVideoRecvImages:](self, "getVideoRecvImages:", -[SDPMediaLine videoImageAttributes:](self, "videoImageAttributes:", [v5 intValue]));
        if ((int)[v10 count] >= 1)
        {
          uint64_t v11 = 0;
          do
          {
            memset(v18, 170, sizeof(v18));
            uint64_t v19 = -1431655766;
            int v20 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", [v10 objectAtIndexedSubscript:v11], v18);
            uint64_t v12 = self->_imageAttributeRules;
            uint64_t v13 = [v5 intValue];
            LODWORD(v14) = v20;
            [(VCImageAttributeRules *)v12 addRuleForVideoPayload:v13 withDirection:1 width:LODWORD(v18[1]) height:HIDWORD(v18[2]) frameRate:v19 priority:(int)*((float *)&v19 + 1) interface:v14];
            ++v11;
          }
          while (v11 < (int)[v10 count]);
        }
      }
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v17);
  }
}

- (void)parseAttribute:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 componentsSeparatedByString:@";"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", @":"), "objectAtIndexedSubscript:", 0);
        uint64_t v11 = v10;
        if (self->_allowRTCPFB || ![v10 isEqualToString:@"rtcp-fb"])
        {
          if ([v11 isEqualToString:@"rtpID"])
          {
            self->_rtpId = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", @":"), "objectAtIndex:", 1), "longLongValue");
          }
          else if ([v11 isEqualToString:@"rtcp"])
          {
            self->_rtcpPort = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", @":"), "objectAtIndex:", 1), "intValue");
          }
          else
          {
            int v12 = [v11 isEqualToString:@"imageattr"];
            [(NSMutableArray *)self->_attributes addObject:v9];
            if (v12) {
              [(SDPMediaLine *)self parseImageAttributeRules:v9];
            }
          }
        }
        else
        {
          self->_allowRTCPFB = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)parseMediaLine:(id)a3
{
  char v5 = 0;
  while (([a3 parsingDone] & 1) == 0)
  {
    int v6 = [a3 fieldType];
    if ((v6 - 1) >= 4)
    {
      if (v6 != 5) {
        return;
      }
      -[SDPMediaLine parseAttribute:](self, "parseAttribute:", [a3 fieldValue]);
      char v5 = 1;
    }
    else
    {
      if (v5) {
        return;
      }
      char v5 = 0;
    }
    [a3 nextLine];
  }
}

- (NSString)string
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:256];
  uint64_t v4 = v3;
  if (self->_rtpId) {
    [v3 appendFormat:@"%@=%@:%u%@", @"a", @"rtpID", self->_rtpId, @"\r\n"];
  }
  if (self->_rtcpPort) {
    [v4 appendFormat:@"%@=%@:%@%@", @"a", @"rtcp", @"%VRTCP-PORT%", @"\r\n"];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  attributes = self->_attributes;
  uint64_t v6 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(attributes);
        }
        [v4 appendFormat:@"%@=%@%@", @"a", *(void *)(*((void *)&v12 + 1) + 8 * v9++), @"\r\n"];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)attributes countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  return (NSString *)v4;
}

- (unsigned)rtpId
{
  return self->_rtpId;
}

- (void)setRtpId:(unsigned int)a3
{
  self->_rtpId = a3;
}

- (int)rtpPort
{
  return self->_rtpPort;
}

- (int)rtcpPort
{
  return self->_rtcpPort;
}

- (NSArray)attributes
{
  return &self->_attributes->super;
}

- (NSArray)payloads
{
  return &self->_payloads->super;
}

- (VCImageAttributeRules)imageAttributeRules
{
  return self->_imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

@end