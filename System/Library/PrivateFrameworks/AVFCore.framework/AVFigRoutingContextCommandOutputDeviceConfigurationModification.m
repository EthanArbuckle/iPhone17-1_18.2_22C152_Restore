@interface AVFigRoutingContextCommandOutputDeviceConfigurationModification
+ (void)initialize;
- (AVFigRoutingContextCommandOutputDeviceConfigurationModification)init;
- (__CFDictionary)routingContextCommandPayload;
- (void)addPeerToHomeGroup:(id)a3;
- (void)dealloc;
- (void)removePeerWithIDFromHomeGroup:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDevicePassword:(id)a3;
- (void)startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:(BOOL)a3;
- (void)stopAutomaticallyAllowingConnectionsFromPeersInHomeGroup;
@end

@implementation AVFigRoutingContextCommandOutputDeviceConfigurationModification

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextCommandOutputDeviceConfigurationModification)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfigurationModification;
  v2 = [(AVFigRoutingContextCommandOutputDeviceConfigurationModification *)&v5 init];
  if (v2)
  {
    v2->_payload = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  payload = self->_payload;
  if (payload) {
    CFRelease(payload);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfigurationModification;
  [(AVFigRoutingContextCommandOutputDeviceConfigurationModification *)&v4 dealloc];
}

- (void)setDeviceName:(id)a3
{
}

- (void)setDevicePassword:(id)a3
{
}

- (void)startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:(BOOL)a3
{
  UInt64 = (const void *)FigCFNumberCreateUInt64();
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E4F20508], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E4F20510], UInt64);
  if (UInt64)
  {
    CFRelease(UInt64);
  }
}

- (void)stopAutomaticallyAllowingConnectionsFromPeersInHomeGroup
{
}

- (void)addPeerToHomeGroup:(id)a3
{
  objc_super v5 = (const void *)*MEMORY[0x1E4F204E8];
  Value = CFDictionaryGetValue(self->_payload, (const void *)*MEMORY[0x1E4F204E8]);
  if (Value) {
    v7 = (__CFArray *)CFRetain(Value);
  }
  else {
    v7 = 0;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  [a3 hasAdministratorPrivileges];
  UInt64 = (const void *)FigCFNumberCreateUInt64();
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204D0], (const void *)[a3 peerID]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204E0], (const void *)[a3 publicKey]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204D8], UInt64);
  if (UInt64) {
    CFRelease(UInt64);
  }
  if (v7)
  {
    CFArrayAppendValue(v7, Mutable);
  }
  else
  {
    v7 = CFArrayCreateMutable(v8, 0, MEMORY[0x1E4F1D510]);
    CFDictionarySetValue(self->_payload, v5, v7);
    CFArrayAppendValue(v7, Mutable);
    if (!v7) {
      goto LABEL_10;
    }
  }
  CFRelease(v7);
LABEL_10:
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)removePeerWithIDFromHomeGroup:(id)a3
{
  values = a3;
  objc_super v4 = (const void *)*MEMORY[0x1E4F204F0];
  Value = CFDictionaryGetValue(self->_payload, (const void *)*MEMORY[0x1E4F204F0]);
  if (!Value)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F204D0], (const void **)&values, 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
LABEL_5:
    Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x1E4F1D510]);
    CFDictionarySetValue(self->_payload, v4, Mutable);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, v8);
    if (!Mutable) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  Mutable = (void *)CFRetain(Value);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F204D0], (const void **)&values, 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    goto LABEL_5;
  }
  CFArrayAppendValue((CFMutableArrayRef)Mutable, v8);
LABEL_6:
  CFRelease(Mutable);
LABEL_7:
  if (v8) {
    CFRelease(v8);
  }
}

- (__CFDictionary)routingContextCommandPayload
{
  return self->_payload;
}

@end