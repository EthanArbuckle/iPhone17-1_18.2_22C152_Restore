@interface MIDICIResponder
+ (id)description;
- (BOOL)containsValidChannels:(id)a3;
- (BOOL)notifyProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel isEnabled:(BOOL)enabledState;
- (BOOL)notifyProperty:(id)a3 onChannel:(unsigned __int8)a4 forSubscribers:(id)a5;
- (BOOL)sendProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData;
- (BOOL)start;
- (MIDICIDeviceInfo)deviceInfo;
- (MIDICIPropertyResponderDelegate)propertyDelegate;
- (MIDICIResponder)init;
- (MIDICIResponder)initWithDeviceInfo:(MIDICIDeviceInfo *)deviceInfo profileDelegate:(id)delegate profileStates:(MIDICIProfileStateList *)profileList supportProperties:(BOOL)propertiesSupported;
- (NSArray)initiators;
- (id)description;
- (id)getInitiators;
- (id)profileDelegate;
- (void)registerProfiles:(id)a3;
- (void)setPropertyDelegate:(id)a3;
@end

@implementation MIDICIResponder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->initiators, 0);
  objc_storeStrong((id *)&self->_profileStates, 0);
  objc_storeStrong((id *)&self->_propertyDelegate, 0);
  objc_storeStrong((id *)&self->_profileDelegate, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_subscribers, 0);
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setPropertyDelegate:(id)a3
{
}

- (MIDICIPropertyResponderDelegate)propertyDelegate
{
  return self->_propertyDelegate;
}

- (id)profileDelegate
{
  return self->_profileDelegate;
}

- (NSArray)initiators
{
  return self->initiators;
}

- (BOOL)start
{
  return 0;
}

- (BOOL)notifyProperty:(id)a3 onChannel:(unsigned __int8)a4 forSubscribers:(id)a5
{
  return 0;
}

- (BOOL)notifyProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel isEnabled:(BOOL)enabledState
{
  return 0;
}

- (BOOL)sendProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData
{
  return 0;
}

- (id)getInitiators
{
  return 0;
}

- (void)registerProfiles:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v39;
  uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v4)
  {
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v53 + 1) + 8 * i);
        unsigned int v7 = [v6 midiChannel];
        if (v7 < 0x10 || v7 == 127)
        {
          v42.__r_.__value_.__s.__data_[0] = v7;
          char v52 = 0;
          v8 = [v6 enabledProfiles];
          char v9 = [v8 count];

          char v52 = v9;
          char v51 = 0;
          v10 = [v6 disabledProfiles];
          char v11 = [v10 count];

          char v51 = v11;
          [v3 appendBytes:&v42 length:1];
          [v3 appendBytes:&v52 length:1];
          long long v50 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v47 = 0u;
          v12 = [v6 enabledProfiles];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v62 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v48 != v14) {
                  objc_enumerationMutation(v12);
                }
                id v16 = *(id *)(*((void *)&v47 + 1) + 8 * j);
                BYTE4(v57) = 0;
                LODWORD(v57) = 0;
                id v17 = [v16 profileID];
                uint64_t v18 = [v17 bytes];
                int v19 = *(_DWORD *)v18;
                BYTE4(v57) = *(unsigned char *)(v18 + 4);
                LODWORD(v57) = v19;

                [v3 appendBytes:&v57 length:5];
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v62 count:16];
            }
            while (v13);
          }

          [v3 appendBytes:&v51 length:1];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v20 = [v6 disabledProfiles];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v44;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v44 != v22) {
                  objc_enumerationMutation(v20);
                }
                id v24 = *(id *)(*((void *)&v43 + 1) + 8 * k);
                BYTE4(v57) = 0;
                LODWORD(v57) = 0;
                id v25 = [v24 profileID];
                uint64_t v26 = [v25 bytes];
                int v27 = *(_DWORD *)v26;
                BYTE4(v57) = *(unsigned char *)(v26 + 4);
                LODWORD(v57) = v27;

                [v3 appendBytes:&v57 length:5];
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
            }
            while (v21);
          }
        }
        else
        {
          NSLog(&cfstr_Registerprofil.isa, [v6 midiChannel]);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v4);
  }

  id v28 = v3;
  uint64_t v29 = [v28 bytes];
  uint64_t v30 = [v28 length];
  memset(&v42, 0, sizeof(v42));
  __s = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  v31 = funopen(&v57, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
  v57 = v31;
  if (v30 >= 1)
  {
    do
    {
      if (v30 >= 16) {
        uint64_t v32 = 16;
      }
      else {
        uint64_t v32 = v30;
      }
      fprintf(v31, "%08lX:  ", v29);
      for (uint64_t m = 0; m != 16; ++m)
      {
        if (m >= v32) {
          fwrite("   ", 3uLL, 1uLL, v31);
        }
        else {
          fprintf(v31, "%02X ", *(unsigned __int8 *)(v29 + m));
        }
      }
      for (uint64_t n = 0; n != 16; ++n)
      {
        if (n >= v32)
        {
          int v35 = 32;
        }
        else if (*(unsigned __int8 *)(v29 + n) - 32 >= 0x5F)
        {
          int v35 = 46;
        }
        else
        {
          int v35 = *(unsigned __int8 *)(v29 + n);
        }
        fputc(v35, v31);
      }
      fputc(10, v31);
      v29 += 16;
      BOOL v36 = v30 <= 16;
      v30 -= 16;
    }
    while (!v36);
    v31 = v57;
  }
  fflush(v31);
  v37 = __s;
  if (!__s)
  {
    v37 = (std::string::value_type *)malloc_type_malloc(1uLL, 0xC3C60566uLL);
    __s = v37;
    uint64_t v60 = 1;
  }
  v37[v59] = 0;
  std::string::__assign_external(&v42, __s);
  fclose(v57);
  free(__s);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v38 = &v42;
  }
  else {
    v38 = (std::string *)v42.__r_.__value_.__r.__words[0];
  }
  NSLog(&cfstr_Registerprofil_0.isa, v38);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
}

- (BOOL)containsValidChannels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        unsigned int v8 = objc_msgSend(v7, "midiChannel", (void)v12);
        BOOL v10 = v8 < 0x10 || v8 == 127;

        if (v10)
        {
          LOBYTE(v4) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v4;
}

- (id)description
{
  id v3 = NSString;
  profileDelegate = self->_profileDelegate;
  uint64_t v5 = [(MIDICIResponder *)self initiators];
  id v6 = [v3 stringWithFormat:@"<MIDICIResponder(%p): delegate:%@ initiators:%@> ", self, profileDelegate, v5];

  return v6;
}

- (MIDICIResponder)initWithDeviceInfo:(MIDICIDeviceInfo *)deviceInfo profileDelegate:(id)delegate profileStates:(MIDICIProfileStateList *)profileList supportProperties:(BOOL)propertiesSupported
{
  BOOL v6 = propertiesSupported;
  char v11 = deviceInfo;
  id v12 = delegate;
  long long v13 = profileList;
  BOOL v14 = [(MIDICIResponder *)self containsValidChannels:v13];
  if (v11 && (BOOL v15 = v14, [(MIDICIDeviceInfo *)v11 midiDestination]) && (v6 || v15))
  {
    v19.receiver = self;
    v19.super_class = (Class)MIDICIResponder;
    id v16 = [(MIDICIResponder *)&v19 init];
    uint64_t v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_profileDelegate, delegate);
      v17->_isStarted = 0;
      v17->_propertiesSupported = v6;
      objc_storeStrong((id *)&v17->_deviceInfo, deviceInfo);
    }
  }
  else
  {
    uint64_t v17 = self;
  }

  return 0;
}

- (MIDICIResponder)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = [NSString stringWithUTF8String:"-[MIDICIResponder init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Unsupported! Don't call %@.", v4 format];

  return 0;
}

+ (id)description
{
  return @"MIDI-CI Responder";
}

@end