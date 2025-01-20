@interface JTAudioMediaItem
- (BOOL)hasAudibleCharacteristic;
- (BOOL)isEqual:(id)a3;
- (JTAudioMediaItem)init;
- (JTAudioMediaItem)initWithInfo:(id)a3 delegate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)info;
- (void)dealloc;
@end

@implementation JTAudioMediaItem

- (JTAudioMediaItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)JTAudioMediaItem;
  v2 = [(JFXMediaItem *)&v5 init];
  v3 = v2;
  if (v2) {
    [(JFXMediaItem *)v2 setMediaType:5];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)JTAudioMediaItem;
  [(JFXMediaItem *)&v2 dealloc];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)JTAudioMediaItem;
  objc_super v2 = [(JFXMediaItem *)&v4 description];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JTAudioMediaItem;
  return [(JFXMediaItem *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JTAudioMediaItem;
  return [(JFXMediaItem *)&v4 isEqual:a3];
}

- (BOOL)hasAudibleCharacteristic
{
  return 1;
}

- (JTAudioMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)JTAudioMediaItem;
  return [(JFXMediaItem *)&v5 initWithInfo:a3 delegate:a4];
}

- (id)info
{
  objc_super v2 = (void *)MEMORY[0x263EFF9A0];
  v6.receiver = self;
  v6.super_class = (Class)JTAudioMediaItem;
  v3 = [(JFXMediaItem *)&v6 info];
  objc_super v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

@end