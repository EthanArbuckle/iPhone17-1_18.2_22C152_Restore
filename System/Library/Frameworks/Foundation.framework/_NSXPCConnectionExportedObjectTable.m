@interface _NSXPCConnectionExportedObjectTable
- (_NSXPCConnectionExportedObjectTable)init;
- (id)description;
- (os_unfair_lock_s)exportedObjectForProxyNumber:(os_unfair_lock_s *)result;
- (os_unfair_lock_s)interfaceForProxyNumber:(os_unfair_lock_s *)result;
- (uint64_t)proxyNumberForExportedObject:(const void *)a3 interface:;
- (void)dealloc;
- (void)invalidate;
- (void)receivedReleaseForProxyNumber:(dispatch_queue_t)queue userQueue:;
- (void)setExportedObject:(const void *)a3 forProxyNumber:;
- (void)setInterface:(const void *)a3 forProxyNumber:;
@end

@implementation _NSXPCConnectionExportedObjectTable

- (_NSXPCConnectionExportedObjectTable)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSXPCConnectionExportedObjectTable;
  v2 = [(_NSXPCConnectionExportedObjectTable *)&v4 init];
  v2->_next = 2;
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_valid = 1;
  v2->_replyGroup = (OS_dispatch_group *)dispatch_group_create();
  return v2;
}

- (void)setInterface:(const void *)a3 forProxyNumber:
{
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock_with_options();
    if (*(unsigned char *)(a1 + 68))
    {
      if (a3 == (const void *)1)
      {
        v7 = *(void **)(a1 + 16);
        if (v7 != a2)
        {

          *(void *)(a1 + 16) = a2;
        }
      }
      else
      {
        _createTablesIfNeeded_locked((CFMutableDictionaryRef)a1);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a3, a2);
      }
    }
    os_unfair_lock_unlock(v6);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objectToProxyNumber = self->_objectToProxyNumber;
  if (objectToProxyNumber) {
    CFRelease(objectToProxyNumber);
  }
  proxyNumberToObject = self->_proxyNumberToObject;
  if (proxyNumberToObject) {
    CFRelease(proxyNumberToObject);
  }
  proxyNumberToInterface = self->_proxyNumberToInterface;
  if (proxyNumberToInterface) {
    CFRelease(proxyNumberToInterface);
  }

  dispatch_release((dispatch_object_t)self->_replyGroup);
  v6.receiver = self;
  v6.super_class = (Class)_NSXPCConnectionExportedObjectTable;
  [(_NSXPCConnectionExportedObjectTable *)&v6 dealloc];
}

- (void)setExportedObject:(const void *)a3 forProxyNumber:
{
  if (a1)
  {
    objc_super v6 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock_with_options();
    if (a3 == (const void *)1)
    {
      uint64_t v7 = *(void **)(a1 + 8);
      if (v7 != a2)
      {

        *(void *)(a1 + 8) = a2;
      }
    }
    else
    {
      _createTablesIfNeeded_locked((CFMutableDictionaryRef)a1);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), a3, a2);
    }
    os_unfair_lock_unlock(v6);
  }
}

- (void)invalidate
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) = 0;
    v3 = *(__CFDictionary **)(a1 + 40);
    if (v3) {
      CFDictionaryRemoveAllValues(v3);
    }
    objc_super v4 = *(__CFDictionary **)(a1 + 24);
    if (v4) {
      CFDictionaryRemoveAllValues(v4);
    }
    uint64_t v5 = *(__CFDictionary **)(a1 + 32);
    if (v5) {
      CFDictionaryRemoveAllValues(v5);
    }

    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (os_unfair_lock_s)interfaceForProxyNumber:(os_unfair_lock_s *)result
{
  if (result)
  {
    v3 = result;
    objc_super v4 = result + 16;
    os_unfair_lock_lock_with_options();
    if (a2 == (const void *)1)
    {
      Value = *(void **)&v3[4]._os_unfair_lock_opaque;
    }
    else
    {
      _createTablesIfNeeded_locked((CFMutableDictionaryRef)v3);
      Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)&v3[8]._os_unfair_lock_opaque, a2);
    }
    id v6 = Value;
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)Value;
  }
  return result;
}

- (os_unfair_lock_s)exportedObjectForProxyNumber:(os_unfair_lock_s *)result
{
  if (result)
  {
    v3 = result;
    objc_super v4 = result + 16;
    os_unfair_lock_lock_with_options();
    if (a2 == (const void *)1)
    {
      Value = *(void **)&v3[2]._os_unfair_lock_opaque;
    }
    else
    {
      _createTablesIfNeeded_locked((CFMutableDictionaryRef)v3);
      Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)&v3[6]._os_unfair_lock_opaque, a2);
    }
    id v6 = Value;
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)Value;
  }
  return result;
}

- (void)receivedReleaseForProxyNumber:(dispatch_queue_t)queue userQueue:
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___NSXPCConnectionExportedObjectTable_receivedReleaseForProxyNumber_userQueue___block_invoke;
    block[3] = &unk_1E51F8B80;
    block[4] = a1;
    block[5] = a2;
    dispatch_group_notify(v3, queue, block);
  }
}

- (uint64_t)proxyNumberForExportedObject:(const void *)a3 interface:
{
  if (!a1) {
    return 0;
  }
  id v6 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock_with_options();
  _createTablesIfNeeded_locked((CFMutableDictionaryRef)a1);
  if (*(unsigned char *)(a1 + 68))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v7 + 1;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)v7, a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), (const void *)v7, a3);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, (const void *)v7);
  }
  else
  {
    uint64_t v7 = -1;
  }
  os_unfair_lock_unlock(v6);
  return v7;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionExportedObjectTable;
  return +[NSString stringWithFormat:@"%@ : Root Obj: %p Root Ifc: %p Object->PN: %p PN->Object: %p", [(_NSXPCConnectionExportedObjectTable *)&v3 description], self->_proxy1Object, self->_proxy1Interface, self->_objectToProxyNumber, self->_proxyNumberToObject];
}

@end