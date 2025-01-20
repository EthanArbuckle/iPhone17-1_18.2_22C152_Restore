@interface CUINamedLookup
- (BOOL)_cacheRenditionProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTintable;
- (BOOL)representsOnDemandContent;
- (CUINamedLookup)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (CUIRenditionKey)key;
- (CUIRenditionKey)renditionKey;
- (CUIThemeRendition)_rendition;
- (NSString)appearance;
- (NSString)keySignature;
- (NSString)name;
- (NSString)renditionName;
- (id)_renditionForSpecificKey:(id)a3;
- (int64_t)appearanceIdentifier;
- (int64_t)displayGamut;
- (int64_t)graphicsClass;
- (int64_t)idiom;
- (int64_t)layoutDirection;
- (int64_t)localization;
- (int64_t)memoryClass;
- (int64_t)sizeClassHorizontal;
- (int64_t)sizeClassVertical;
- (unint64_t)hash;
- (unint64_t)storageRef;
- (unint64_t)subtype;
- (unsigned)_distilledInVersion;
- (void)dealloc;
- (void)lock;
- (void)setKey:(id)a3;
- (void)setName:(id)a3;
- (void)setRepresentsOnDemandContent:(BOOL)a3;
- (void)setStorageRef:(unint64_t)a3;
- (void)unlock;
@end

@implementation CUINamedLookup

- (unint64_t)hash
{
  return LOWORD(self->_storageRef) | ([(NSString *)self->_signature hash] << 16);
}

- (id)_renditionForSpecificKey:(id)a3
{
  v5 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id v6 = [a3 keyList];
  signature = self->_signature;
  return [v5 renditionWithKey:v6 usingKeySignature:signature];
}

- (void)setRepresentsOnDemandContent:(BOOL)a3
{
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xFE | a3;
}

- (NSString)keySignature
{
  return self->_signature;
}

- (int64_t)layoutDirection
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeDirection];
}

- (CUINamedLookup)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)CUINamedLookup;
  v8 = [(CUINamedLookup *)&v16 init];
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_key = (CUIRenditionKey *)[a4 copy];
    v8->_storageRef = a5;
    if ([(CUINamedLookup *)v8 _cacheRenditionProperties])
    {
      v8->_lock._os_unfair_lock_opaque = 0;
    }
    else
    {
      [(CUINamedLookup *)v8 key];
      _CUILog(4, (uint64_t)"CoreUI: unable to locate asset '%@' key:%@ releasing", v9, v10, v11, v12, v13, v14, (uint64_t)a3);

      return 0;
    }
  }
  return v8;
}

- (BOOL)_cacheRenditionProperties
{
  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  self->_signature = (NSString *)objc_msgSend(v3, "copyLookupKeySignatureForKey:", -[CUIRenditionKey keyList](self->_key, "keyList"));
  self->_distilledInVersion = [v3 distilledInCoreUIVersion];
  return 1;
}

- (int64_t)appearanceIdentifier
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeAppearance];
}

- (CUIRenditionKey)renditionKey
{
  return self->_key;
}

- (unsigned)_distilledInVersion
{
  return self->_distilledInVersion;
}

- (NSString)name
{
  return self->_name;
}

- (CUIThemeRendition)_rendition
{
  return (CUIThemeRendition *)[(CUINamedLookup *)self _renditionForSpecificKey:self->_key];
}

- (void)unlock
{
}

- (void)lock
{
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0 || *((void *)a3 + 4) != self->_storageRef) {
    return 0;
  }
  v5 = (void *)*((void *)a3 + 3);
  signature = self->_signature;
  return [v5 isEqualToString:signature];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUINamedLookup;
  [(CUINamedLookup *)&v3 dealloc];
}

- (unint64_t)storageRef
{
  return self->_storageRef;
}

- (NSString)renditionName
{
  v2 = [(CUINamedLookup *)self _rendition];
  return (NSString *)[(CUIThemeRendition *)v2 name];
}

- (BOOL)representsOnDemandContent
{
  return *((unsigned char *)self + 48) & 1;
}

- (BOOL)isTintable
{
  v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 isTintable];
}

- (int64_t)idiom
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] keyList], 15);
}

- (unint64_t)subtype
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] keyList], 16);
}

- (int64_t)sizeClassHorizontal
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] keyList], 20);
}

- (int64_t)sizeClassVertical
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] keyList], 21);
}

- (int64_t)memoryClass
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeMemoryClass];
}

- (int64_t)graphicsClass
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeGraphicsClass];
}

- (int64_t)displayGamut
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeDisplayGamut];
}

- (int64_t)localization
{
  v2 = [(CUINamedLookup *)self renditionKey];
  return [(CUIRenditionKey *)v2 themeLocalization];
}

- (NSString)appearance
{
  objc_super v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  v4 = (NSString *)objc_msgSend(v3, "nameForAppearanceIdentifier:", (unsigned __int16)-[CUIRenditionKey themeAppearance](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeAppearance"));
  if ([(NSString *)v4 length]) {
    return v4;
  }
  return (NSString *)[v3 defaultAppearanceName];
}

- (void)setName:(id)a3
{
}

- (CUIRenditionKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void)setStorageRef:(unint64_t)a3
{
  self->_storageRef = a3;
}

@end