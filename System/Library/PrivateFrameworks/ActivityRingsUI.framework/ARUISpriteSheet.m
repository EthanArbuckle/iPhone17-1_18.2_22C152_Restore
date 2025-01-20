@interface ARUISpriteSheet
- (ARUISpriteSheet)initWithSpriteSheet:(id)a3;
- (ARUISpriteSheet)initWithTexture:(id)a3 sprites:(id)a4;
- (ARUISpriteTexture)texture;
- (NSArray)sprites;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation ARUISpriteSheet

- (NSArray)sprites
{
  return self->_sprites;
}

- (ARUISpriteTexture)texture
{
  return self->_texture;
}

- (ARUISpriteSheet)initWithTexture:(id)a3 sprites:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpriteSheet;
  v9 = [(ARUISpriteSheet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_texture, a3);
    objc_storeStrong((id *)&v10->_sprites, a4);
  }

  return v10;
}

- (ARUISpriteSheet)initWithSpriteSheet:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpriteSheet;
  v5 = [(ARUISpriteSheet *)&v14 init];
  if (v5)
  {
    v6 = [v4 texture];
    uint64_t v7 = [v6 copy];
    texture = v5->_texture;
    v5->_texture = (ARUISpriteTexture *)v7;

    id v9 = objc_alloc(MEMORY[0x263EFF8C0]);
    v10 = [v4 sprites];
    uint64_t v11 = [v9 initWithArray:v10 copyItems:1];
    sprites = v5->_sprites;
    v5->_sprites = (NSArray *)v11;
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ARUISpriteSheet;
  v3 = [(ARUISpriteSheet *)&v7 description];
  id v4 = objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v5 = [NSString stringWithFormat:@"%@, texture: %@, sprites: %@>", v4, self->_texture, self->_sprites];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ARUISpriteSheet allocWithZone:a3];

  return [(ARUISpriteSheet *)v4 initWithSpriteSheet:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);

  objc_storeStrong((id *)&self->_sprites, 0);
}

@end