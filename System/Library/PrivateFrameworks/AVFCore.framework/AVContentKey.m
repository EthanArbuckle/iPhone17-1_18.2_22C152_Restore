@interface AVContentKey
+ (AVContentKey)contentKeyWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6;
- (AVContentKey)initWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6;
- (AVContentKeySpecifier)contentKeySpecifier;
- (OpaqueFigCPECryptor)cryptor;
- (OpaqueFigContentKeySpecifier)_internalContentKeySpecifier;
- (int64_t)externalContentProtectionStatus;
- (void)dealloc;
- (void)revoke;
@end

@implementation AVContentKey

- (AVContentKey)initWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6
{
  v15.receiver = self;
  v15.super_class = (Class)AVContentKey;
  v10 = [(AVContentKey *)&v15 init];
  if (v10)
  {
    v10->contentKeySpecifier = (AVContentKeySpecifier *)[a3 copy];
    if (a4) {
      v11 = (OpaqueFigCPECryptor *)CFRetain(a4);
    }
    else {
      v11 = 0;
    }
    v10->_cryptor = v11;
    if (a6) {
      v12 = (OpaqueFigContentKeySpecifier *)CFRetain(a6);
    }
    else {
      v12 = 0;
    }
    v10->_contentKeySpecifier = v12;
    if (a5) {
      v13 = (OpaqueFigContentKeyBoss *)CFRetain(a5);
    }
    else {
      v13 = 0;
    }
    v10->_keyBoss = v13;
  }
  return v10;
}

- (void)dealloc
{
  cryptor = self->_cryptor;
  if (cryptor) {
    CFRelease(cryptor);
  }
  keyBoss = self->_keyBoss;
  if (keyBoss) {
    CFRelease(keyBoss);
  }
  contentKeySpecifier = self->_contentKeySpecifier;
  if (contentKeySpecifier) {
    CFRelease(contentKeySpecifier);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVContentKey;
  [(AVContentKey *)&v6 dealloc];
}

- (int64_t)externalContentProtectionStatus
{
  int v8 = 1;
  keyBoss = self->_keyBoss;
  contentKeySpecifier = self->_contentKeySpecifier;
  v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  objc_super v6 = (unsigned int (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v5[14];
  if (!v6 || *v5 < 3uLL || v6(keyBoss, contentKeySpecifier, &v8)) {
    return 0;
  }
  if (v8 == 2) {
    return 1;
  }
  return 2 * (v8 == 3);
}

- (OpaqueFigContentKeySpecifier)_internalContentKeySpecifier
{
  return self->_contentKeySpecifier;
}

+ (AVContentKey)contentKeyWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6
{
  objc_super v6 = [[AVContentKey alloc] initWithSpecifier:a3 cryptor:a4 contentKeyBoss:a5 contentKeySpecifier:a6];
  return v6;
}

- (OpaqueFigCPECryptor)cryptor
{
  return self->_cryptor;
}

- (void)revoke
{
  keyBoss = self->_keyBoss;
  contentKeySpecifier = self->_contentKeySpecifier;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  objc_super v6 = *(void (**)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *))(v5 + 128);
  if (v6)
  {
    v6(keyBoss, contentKeySpecifier);
  }
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->contentKeySpecifier;
}

@end