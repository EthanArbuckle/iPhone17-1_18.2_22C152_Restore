@interface DTActivityTapTableDecoder
- (BOOL)hasFailed;
- (BOOL)isOutOfData;
- (BOOL)next;
- (DTActivityTapTableDecoder)init;
- (NSString)category;
- (NSString)format;
- (NSString)processImagePath;
- (NSString)processName;
- (NSString)senderImageName;
- (NSString)senderImagePath;
- (NSString)subsystem;
- (NSTimeZone)timeZone;
- (XRConstantEngineeringValue)backtrace;
- (XRConstantEngineeringValue)message;
- (XRConstantEngineeringValue)process;
- (XRConstantEngineeringValue)senderImageUUID;
- (XRConstantEngineeringValue)thread;
- (double)unixTimeInterval;
- (id).cxx_construct;
- (unint64_t)senderImageOffset;
- (unint64_t)time;
- (unsigned)messageType;
- (void)addData:(id)a3;
- (void)addMemo:(id)a3;
@end

@implementation DTActivityTapTableDecoder

- (DTActivityTapTableDecoder)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTActivityTapTableDecoder;
  v2 = [(DTActivityTapTableDecoder *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    memos = v2->_memos;
    v2->_memos = (NSMutableArray *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x400000];
    stack = v2->_stack;
    v2->_stack = (NSMutableData *)v5;

    operator new();
  }
  return 0;
}

- (void)addMemo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSMutableArray *)self->_memos addObject:v4];
  }
}

- (void)addData:(id)a3
{
  id v5 = a3;
  id v4 = [[DTActivityTraceTapMemo alloc] initWithData:v5];
  [(DTActivityTapTableDecoder *)self addMemo:v4];
}

- (BOOL)next
{
  if (self->_failed) {
    return 0;
  }
  if (self->_currentChunk) {
    goto LABEL_8;
  }
  if ([(NSMutableArray *)self->_memos count])
  {
    id v4 = [(NSMutableArray *)self->_memos firstObject];
    currentChunk = self->_currentChunk;
    self->_currentChunk = v4;

    [(NSMutableArray *)self->_memos removeObjectAtIndex:0];
    __p = 0;
    v6 = [(DTActivityTraceTapMemo *)self->_currentChunk getBufferWithLength:&__p];
    unint64_t v7 = (unint64_t)__p;
    if (!__p) {
      return 0;
    }
    *(void *)self->_decoder.__ptr_.__value_ = v6;
    *((void *)self->_decoder.__ptr_.__value_ + 2) = *(void *)self->_decoder.__ptr_.__value_
                                                    + (v7 & 0xFFFFFFFFFFFFFFFELL);
    *((void *)self->_decoder.__ptr_.__value_ + 1) = *(void *)self->_decoder.__ptr_.__value_;
    self->_outOfData = 0;
  }
  if (self->_currentChunk)
  {
LABEL_8:
    p_columns = &self->_columns;
    while (1)
    {
      sub_23089A240((uint64_t *)self->_tableRowDecoder.__ptr_.__value_);
      int v9 = *((_DWORD *)self->_decoder.__ptr_.__value_ + 20);
      if (v9 != 1)
      {
        if (v9 == 4)
        {
          v13 = [(NSMutableArray *)self->_memos firstObject];
          v14 = self->_currentChunk;
          self->_currentChunk = v13;

          if (!self->_currentChunk) {
            goto LABEL_116;
          }
          [(NSMutableArray *)self->_memos removeObjectAtIndex:0];
          __p = 0;
          v15 = [(DTActivityTraceTapMemo *)self->_currentChunk getBufferWithLength:&__p];
          unint64_t v16 = (unint64_t)__p;
          if (!__p) {
            return 0;
          }
          *(void *)self->_decoder.__ptr_.__value_ = v15;
          *((void *)self->_decoder.__ptr_.__value_ + 2) = *(void *)self->_decoder.__ptr_.__value_
                                                          + (v16 & 0xFFFFFFFFFFFFFFFELL);
          *((void *)self->_decoder.__ptr_.__value_ + 1) = *(void *)self->_decoder.__ptr_.__value_;
          self->_outOfData = 0;
        }
        else if ((v9 - 5) < 2)
        {
          BOOL result = 0;
          self->_failed = 1;
          return result;
        }
        goto LABEL_21;
      }
      value = self->_tableRowDecoder.__ptr_.__value_;
      uint64_t v11 = *((void *)value + 9);
      if (*(_DWORD *)(v11 + 80) != 1) {
        goto LABEL_21;
      }
      unsigned int v12 = *(unsigned __int16 *)(v11 + 88);
      if (v12 == 1) {
        break;
      }
      if (v12 == 2 && self->_osLogTableID == v12 >> 8) {
        return 1;
      }
LABEL_21:
      if (self->_failed) {
        return 0;
      }
    }
    __p = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    if (!sub_23089A57C((uint64_t)value, (uint64_t)&__p)) {
      goto LABEL_32;
    }
    if (SHIBYTE(v41) < 0)
    {
      p_p = __p;
      if (v40 != 6)
      {
        operator delete(__p);
        goto LABEL_21;
      }
    }
    else
    {
      if (SHIBYTE(v41) != 6) {
        goto LABEL_21;
      }
      p_p = &__p;
    }
    if (*(_DWORD *)p_p != 1814917999 || p_p[2] != 26479)
    {
LABEL_32:
      char v19 = 1;
      goto LABEL_33;
    }
    v20 = self->_tableRowDecoder.__ptr_.__value_;
    uint64_t v21 = *((void *)v20 + 9);
    if (*(_DWORD *)(v21 + 80) == 1 && (__int16 v22 = *(_WORD *)(v21 + 88), v22 - 1 < 2))
    {
      self->_osLogTableID = HIBYTE(v22);
      *(void *)&p_columns->time = -1;
      *(void *)&self->_columns.thread = -1;
      unsigned __int8 v38 = 0;
      if (sub_23089A6F4((uint64_t)v20, &v38))
      {
        if (v38)
        {
          for (unsigned __int8 i = 0; v38 > i; ++i)
          {
            v35 = 0;
            uint64_t v36 = 0;
            uint64_t v37 = 0;
            int v24 = sub_23089A774((uint64_t)self->_tableRowDecoder.__ptr_.__value_, i, (uint64_t)&v35);
            char v25 = v24;
            if (!v24)
            {
              self->_failed = 1;
              goto LABEL_108;
            }
            if (SHIBYTE(v37) < 0)
            {
              uint64_t v26 = v36;
              if (v36 == 4 && *(_DWORD *)v35 == 1701669236)
              {
LABEL_77:
                p_columns->time = i;
                goto LABEL_108;
              }
              if (v36 == 8)
              {
                if (*(void *)v35 == 0x79726F6765746163) {
                  goto LABEL_88;
                }
                uint64_t v26 = v36;
              }
              if (v26 == 9)
              {
                if (*(void *)v35 == 0x6574737973627573 && *((unsigned char *)v35 + 8) == 109)
                {
LABEL_89:
                  self->_columns.subsystem = i;
                  goto LABEL_108;
                }
                uint64_t v26 = v36;
              }
              if (v26 == 17)
              {
                v28 = (uint64_t *)v35;
                goto LABEL_67;
              }
            }
            else
            {
              if (HIBYTE(v37) <= 8u)
              {
                if (HIBYTE(v37) == 4)
                {
                  if (v35 == 1701669236) {
                    goto LABEL_77;
                  }
                }
                else if (HIBYTE(v37) == 8 && v35 == (void *)0x79726F6765746163)
                {
LABEL_88:
                  self->_columns.category = i;
                  goto LABEL_108;
                }
                goto LABEL_82;
              }
              if (HIBYTE(v37) == 9)
              {
                if (v35 == (void *)0x6574737973627573 && v36 == 109) {
                  goto LABEL_89;
                }
              }
              else if (HIBYTE(v37) == 17)
              {
                v28 = (uint64_t *)&v35;
LABEL_67:
                uint64_t v29 = *v28;
                uint64_t v30 = v28[1];
                int v31 = *((unsigned __int8 *)v28 + 16);
                if (v29 == 0x692D7265646E6573 && v30 == 0x7461702D6567616DLL && v31 == 104)
                {
                  self->_columns.senderImagePath = i;
                  goto LABEL_108;
                }
              }
            }
LABEL_82:
            if (sub_23089A660(&v35, "process-image-path"))
            {
              self->_columns.processImagePath = i;
            }
            else if (sub_23089A660(&v35, "sender-image-name"))
            {
              self->_columns.senderImageName = i;
            }
            else if (sub_23089A660(&v35, "sender-image-uuid"))
            {
              self->_columns.senderImageUUID = i;
            }
            else if (sub_23089A660(&v35, "sender-image-offset"))
            {
              self->_columns.senderImageOffset = i;
            }
            else if (sub_23089A660(&v35, "format-string"))
            {
              self->_columns.format = i;
            }
            else if (sub_23089A660(&v35, "message"))
            {
              self->_columns.message = i;
            }
            else if (sub_23089A660(&v35, "backtrace"))
            {
              self->_columns.backtrace = i;
            }
            else if (sub_23089A660(&v35, "process"))
            {
              self->_columns.process = i;
            }
            else if (sub_23089A660(&v35, "thread"))
            {
              self->_columns.thread = i;
            }
            else if (sub_23089A660(&v35, "message-type"))
            {
              self->_columns.messageType = i;
            }
            else if (sub_23089A660(&v35, "timezone-name"))
            {
              self->_columns.timezoneName = i;
            }
            else if (sub_23089A660(&v35, "unix-time-interval"))
            {
              self->_columns.unixTimeInterval = i;
            }
LABEL_108:
            if (SHIBYTE(v37) < 0) {
              operator delete(v35);
            }
            if ((v25 & 1) == 0) {
              goto LABEL_115;
            }
          }
        }
        char v19 = 1;
      }
      else
      {
        self->_failed = 1;
LABEL_115:
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
      self->_failed = 1;
    }
LABEL_33:
    if (SHIBYTE(v41) < 0) {
      operator delete(__p);
    }
    if ((v19 & 1) == 0) {
      return 0;
    }
    goto LABEL_21;
  }
LABEL_116:
  BOOL result = 0;
  self->_outOfData = 1;
  return result;
}

- (unint64_t)time
{
  return sub_23089A8B0(self, self->_columns.time);
}

- (NSString)subsystem
{
  return (NSString *)sub_23089A940(self, self->_columns.subsystem);
}

- (NSString)category
{
  return (NSString *)sub_23089A940(self, self->_columns.category);
}

- (NSString)senderImagePath
{
  return (NSString *)sub_23089A940(self, self->_columns.senderImagePath);
}

- (NSString)senderImageName
{
  return (NSString *)sub_23089A940(self, self->_columns.senderImageName);
}

- (NSString)format
{
  return (NSString *)sub_23089A940(self, self->_columns.format);
}

- (NSString)processImagePath
{
  return (NSString *)sub_23089A940(self, self->_columns.processImagePath);
}

- (NSString)processName
{
  v2 = [(DTActivityTapTableDecoder *)self processImagePath];
  uint64_t v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (XRConstantEngineeringValue)process
{
  if (sub_23089AACC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.process))
  {
    uint64_t v3 = *((void *)self->_tableRowDecoder.__ptr_.__value_ + 9);
    long long v6 = *(_OWORD *)(v3 + 64);
    id v4 = sub_23089AB50(&v6, v3, self);
  }
  else
  {
    id v4 = 0;
  }
  return (XRConstantEngineeringValue *)v4;
}

- (XRConstantEngineeringValue)thread
{
  v26[2] = *MEMORY[0x263EF8340];
  if (sub_23089AACC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.thread))
  {
    uint64_t v3 = (void *)*((void *)self->_tableRowDecoder.__ptr_.__value_ + 9);
    uint64_t v4 = v3[9];
    if (*(unsigned char *)(v4 + 8) == 19)
    {
      uint64_t v5 = v3[8];
      uint64_t v6 = v5 + *(unsigned int *)(v4 + 4);
      if (*(_DWORD *)(v6 - 4) == 2)
      {
        unint64_t v7 = (uint64_t *)(v3[3] + *(unsigned int *)(v6 - 28));
        v3[8] = v7;
        v3[9] = v6 - 28;
        uint64_t v8 = *(unsigned int *)(v6 - 24);
        uint64_t v9 = *v7;
        uint64_t v25 = *v7;
        if (v8 <= 7)
        {
          memset((char *)&v26[-1] + v8, *(unsigned __int8 *)(v6 - 19), 8 - v8);
          uint64_t v9 = v25;
        }
        v10 = [(XRIntKeyedDictionary *)self->_threadsByTID objectForIntegerKey:v9];
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
LABEL_8:

          goto LABEL_13;
        }
        if (*(unsigned char *)(v4 + 8) == 19)
        {
          uint64_t v13 = v5 + *(unsigned int *)(v4 + 4);
          unsigned int v16 = *(_DWORD *)(v13 - 4);
          uint64_t v14 = v13 - 4;
          unsigned int v15 = v16;
          if (v16 >= 2)
          {
            uint64_t v17 = v14 - 12 * v15;
            v3[8] = v3[3] + *(unsigned int *)(v17 + 12);
            v3[9] = v17 + 12;
            long long v24 = *((_OWORD *)v3 + 4);
            v18 = sub_23089AB50(&v24, (uint64_t)v3, self);
            char v19 = (void *)MEMORY[0x263F38CD0];
            v20 = [NSNumber numberWithUnsignedLongLong:v9];
            uint64_t v21 = [v19 engineeringValueWithTypeID:7 value:v20];

            v26[0] = v21;
            v26[1] = v18;
            __int16 v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
            id v12 = [MEMORY[0x263F38CD0] engineeringValueWithTypeID:8 value:v22];

            goto LABEL_8;
          }
        }
      }
    }
  }
  id v12 = 0;
LABEL_13:
  return (XRConstantEngineeringValue *)v12;
}

- (unsigned)messageType
{
  v2 = sub_23089A940(self, self->_columns.messageType);
  if (qword_268707EE0 != -1) {
    dispatch_once(&qword_268707EE0, &unk_26E515588);
  }
  uint64_t v3 = [(id)qword_268707EE8 objectForKeyedSubscript:v2];
  unsigned __int8 v4 = [v3 unsignedIntValue];

  return v4;
}

- (XRConstantEngineeringValue)senderImageUUID
{
  if (sub_23089AACC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.senderImageUUID))
  {
    uint64_t v3 = *((void *)self->_tableRowDecoder.__ptr_.__value_ + 9);
    long long v6 = *(_OWORD *)(v3 + 64);
    unsigned __int8 v4 = sub_23089B164(&v6, (void *)v3);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  return (XRConstantEngineeringValue *)v4;
}

- (unint64_t)senderImageOffset
{
  return sub_23089A8B0(self, self->_columns.senderImageOffset);
}

- (NSTimeZone)timeZone
{
  v2 = sub_23089A940(self, self->_columns.timezoneName);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA18] timeZoneWithName:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSTimeZone *)v3;
}

- (double)unixTimeInterval
{
  __int16 unixTimeInterval = self->_columns.unixTimeInterval;
  uint64_t v3 = self;
  double v4 = 0.0;
  if (sub_23089AACC(v3->_tableRowDecoder.__ptr_.__value_, unixTimeInterval))
  {
    value = v3->_decoder.__ptr_.__value_;
    unint64_t v7 = (double *)*((void *)value + 8);
    uint64_t v6 = *((void *)value + 9);
    uint64_t v8 = *(unsigned int *)(v6 + 4);
    double v9 = *v7;
    double v11 = v9;
    if (v8 > 7)
    {
      double v4 = v9;
    }
    else
    {
      memset((char *)&v11 + v8, *(unsigned __int8 *)(v6 + 9), 8 - v8);
      double v4 = v11;
    }
  }

  return v4;
}

- (XRConstantEngineeringValue)backtrace
{
  value = self->_decoder.__ptr_.__value_;
  if (sub_23089AACC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.backtrace))
  {
    long long v5 = *((_OWORD *)value + 4);
    uint64_t v3 = sub_23089B544(&v5, value);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (XRConstantEngineeringValue *)v3;
}

- (XRConstantEngineeringValue)message
{
  __int16 message = self->_columns.message;
  uint64_t v3 = self;
  value = v3->_decoder.__ptr_.__value_;
  if (sub_23089AACC(v3->_tableRowDecoder.__ptr_.__value_, message)
    && (uint64_t v5 = *((void *)value + 8),
        v85 = (const char **)((char *)value + 64),
        uint64_t v6 = *((void *)value + 9),
        *(unsigned char *)(v6 + 8) == 19))
  {
    unsigned int v7 = *(_DWORD *)(v5 + *(unsigned int *)(v6 + 4) - 4);
    v83 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    if (v7)
    {
      int v8 = 0;
      uint64_t v9 = v5 - 4;
      buffer = v3->_buffer;
      do
      {
        if (*(unsigned char *)(v6 + 8) == 19)
        {
          v10 = (unsigned int *)(v9 + *(unsigned int *)(v6 + 4));
          uint64_t v11 = *v10;
          if (v11 > (unsigned __int16)v8)
          {
            uint64_t v12 = (unsigned __int16)v8 - v11;
            uint64_t v13 = &v10[3 * v12];
            uint64_t v14 = *((void *)value + 3);
            uint64_t v15 = v14 + *v13;
            *((void *)value + 8) = v15;
            *((void *)value + 9) = v13;
            int v17 = *((unsigned __int8 *)v13 + 8);
            unsigned int v16 = v13 + 2;
            if (v17 == 19)
            {
              v18 = &v10[3 * v12];
              unsigned int v20 = v18[1];
              char v19 = v18 + 1;
              uint64_t v21 = v15 + v20;
              unsigned int v24 = *(_DWORD *)(v21 - 4);
              uint64_t v22 = v21 - 4;
              uint64_t v23 = v24;
              if (v24)
              {
                uint64_t v25 = (unsigned int *)(v22 - 12 * v23);
                *((void *)value + 8) = v14 + *v25;
                *((void *)value + 9) = v25;
                v86 = [NSString stringWithUTF8String:sub_23089D20C(v85, buffer, 0x400uLL)];
                if (v86)
                {
                  uint64_t v26 = XREngineeringTypeIDForMnemonic();
                  if (*v16 == 19)
                  {
                    uint64_t v27 = v15 + *v19;
                    unsigned int v30 = *(_DWORD *)(v27 - 4);
                    uint64_t v29 = v27 - 4;
                    uint64_t v28 = v30;
                    if (v30 >= 2)
                    {
                      uint64_t v31 = v26;
                      uint64_t v32 = 1 - v28;
                      v33 = (char *)(v29 + 12 * (1 - v28));
                      uint64_t v34 = *((void *)value + 3);
                      v35 = (size_t *)(v34 + *(unsigned int *)v33);
                      *((void *)value + 8) = v35;
                      *((void *)value + 9) = v33;
                      switch(*(unsigned char *)(MEMORY[0x263F38D08] + v26))
                      {
                        case 0:
                        case 5:
                          goto LABEL_13;
                        case 1:
                          uint64_t v37 = *(unsigned int *)(v29 + 12 * v32 + 4);
                          size_t v38 = *v35;
                          *(void *)&long long v87 = *v35;
                          if (v37 <= 7)
                          {
                            memset((char *)&v87 + v37, *(unsigned __int8 *)(v29 + 12 * v32 + 9), 8 - v37);
                            size_t v38 = v87;
                          }
                          v39 = (void *)MEMORY[0x263F38CD0];
                          uint64_t v40 = [NSNumber numberWithUnsignedLongLong:v38];
                          uint64_t v41 = [v39 engineeringValueWithTypeID:v31 value:v40];
                          [v83 addObject:v41];
                          goto LABEL_31;
                        case 2:
                          uint64_t v42 = *(unsigned int *)(v29 + 12 * v32 + 4);
                          uint64_t v43 = *(unsigned int *)v35;
                          LODWORD(v87) = *(_DWORD *)v35;
                          if (v42 <= 3)
                          {
                            memset((char *)&v87 + v42, *(unsigned __int8 *)(v29 + 12 * v32 + 9), 4 - v42);
                            uint64_t v43 = v87;
                          }
                          v44 = (void *)MEMORY[0x263F38CD0];
                          uint64_t v40 = [NSNumber numberWithUnsignedInt:v43];
                          uint64_t v41 = [v44 engineeringValueWithTypeID:v31 value:v40];
                          [v83 addObject:v41];
                          goto LABEL_31;
                        case 3:
                          v45 = [NSString stringWithUTF8String:sub_23089D20C(v85, buffer, 0x400uLL)];
                          v46 = [MEMORY[0x263F38CD0] engineeringValueWithTypeID:v31 value:v45];
                          [v83 addObject:v46];

                          break;
                        case 4:
                          if (v26 == 163)
                          {
                            long long v87 = *(_OWORD *)v85;
                            uint64_t v36 = sub_23089B544(&v87, value);
                            if (v36) {
                              [v83 addObject:v36];
                            }
                            goto LABEL_14;
                          }
                          if (v26 != 193)
                          {
LABEL_13:
                            uint64_t v36 = [MEMORY[0x263F38CD0] engineeringValueWithTypeID:v26 value:0];
                            [v83 addObject:v36];
LABEL_14:

                            break;
                          }
                          v78 = v35;
                          v80 = (unsigned char *)(v29 + 12 * v32 + 8);
                          if (*v80 == 19)
                          {
                            v47 = (char *)v35 + *(unsigned int *)(v29 + 12 * v32 + 4);
                            unsigned int v50 = *((_DWORD *)v47 - 1);
                            v48 = v47 - 4;
                            uint64_t v49 = v50;
                            v51 = v35;
                            if (v50)
                            {
                              v33 = &v48[-12 * v49];
                              v51 = (size_t *)(v34 + *(unsigned int *)v33);
                              *((void *)value + 8) = v51;
                              *((void *)value + 9) = v33;
                            }
                          }
                          else
                          {
                            v51 = v35;
                          }
                          uint64_t v56 = *((unsigned int *)v33 + 1);
                          size_t v57 = *v51;
                          *(void *)&long long v87 = *v51;
                          if (v56 <= 7)
                          {
                            memset((char *)&v87 + v56, v33[9], 8 - v56);
                            size_t v57 = v87;
                          }
                          if (v57 >> 22 > 0x18)
                          {
LABEL_53:
                            id v72 = 0;
                          }
                          else
                          {
                            id v81 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v57];
                            uint64_t v58 = [v81 mutableBytes];
                            if (v57)
                            {
                              v59 = (void *)v58;
                              v60 = (char *)v78 - 4;
                              v61 = (unsigned int *)(v29 + 12 * v32 + 4);
                              unsigned __int16 v62 = 1;
                              v77 = v61;
                              while (1)
                              {
                                if (*v80 != 19
                                  || (v63 = &v60[*v61], uint64_t v64 = *(unsigned int *)v63, v64 <= v62))
                                {

                                  goto LABEL_53;
                                }
                                uint64_t v65 = v62 - v64;
                                v66 = (unsigned int *)&v63[12 * v65];
                                v67 = (void *)(*((void *)value + 3) + *v66);
                                *((void *)value + 8) = v67;
                                *((void *)value + 9) = v66;
                                size_t v68 = v57 - 8;
                                if (v57 < 8) {
                                  break;
                                }
                                uint64_t v69 = *(unsigned int *)&v63[12 * v65 + 4];
                                void *v59 = *v67;
                                if (v69 <= 7)
                                {
                                  size_t v79 = v57;
                                  v70 = v60;
                                  memset((char *)v59 + v69, *(unsigned __int8 *)(*((void *)value + 9) + 9), 8 - v69);
                                  v60 = v70;
                                  v61 = v77;
                                  size_t v57 = v79;
                                }
                                ++v62;
                                ++v59;
                                BOOL v71 = (uint64_t)v57 < 9;
                                size_t v57 = v68;
                                if (v71) {
                                  goto LABEL_57;
                                }
                              }
                              uint64_t v73 = *(unsigned int *)&v63[12 * v65 + 4];
                              uint64_t __src = *v67;
                              if (v73 <= 7) {
                                memset((char *)&__src + v73, v63[12 * v65 + 9], 8 - v73);
                              }
                              memcpy(v59, &__src, v57);
                            }
LABEL_57:
                            id v72 = v81;
                          }
                          v82 = v72;
                          v74 = [MEMORY[0x263F38CD0] engineeringValueWithTypeID:193 value:];
                          [v83 addObject:v74];

                          break;
                        case 6:
                          uint64_t v52 = *(unsigned int *)(v29 + 12 * v32 + 4);
                          double v53 = *(double *)v35;
                          *(void *)&long long v87 = *v35;
                          if (v52 > 7)
                          {
                            double v54 = v53;
                          }
                          else
                          {
                            memset((char *)&v87 + v52, *(unsigned __int8 *)(v29 + 12 * v32 + 9), 8 - v52);
                            double v54 = *(double *)&v87;
                          }
                          v55 = (void *)MEMORY[0x263F38CD0];
                          uint64_t v40 = [NSNumber numberWithDouble:v54];
                          uint64_t v41 = [v55 engineeringValueWithTypeID:v31 value:v40];
                          [v83 addObject:v41];
LABEL_31:

                          break;
                        default:
                          break;
                      }
                    }
                  }
                }

                uint64_t v9 = v5 - 4;
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v7);
    }
    v75 = [MEMORY[0x263F38CD0] engineeringValueWithTypeID:46 value:v83];
  }
  else
  {
    v75 = 0;
  }

  return (XRConstantEngineeringValue *)v75;
}

- (BOOL)isOutOfData
{
  return self->_outOfData;
}

- (BOOL)hasFailed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadsByTID, 0);
  objc_storeStrong((id *)&self->_processesByPID, 0);
  value = self->_decoder.__ptr_.__value_;
  self->_decoder.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x230FC10E0](value, 0x10F0C409877F7D9);
  }
  double v4 = self->_tableRowDecoder.__ptr_.__value_;
  self->_tableRowDecoder.__ptr_.__value_ = 0;
  if (v4) {
    sub_23089D374((uint64_t)&self->_tableRowDecoder, (uint64_t)v4);
  }
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_currentChunk, 0);
  objc_storeStrong((id *)&self->_memos, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end