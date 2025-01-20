@interface GKGameMatch
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKGame)game;
- (GKGameMatch)init;
- (GKGameMatch)initWithInternalRepresentation:(id)a3 game:(id)a4;
- (GKPlayer)player;
- (GKRecentMatchInternal)internal;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setGame:(id)a3;
- (void)setInternal:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKGameMatch

- (GKGameMatch)initWithInternalRepresentation:(id)a3 game:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[GKInternalRepresentation internalRepresentation];
  }
  v20.receiver = self;
  v20.super_class = (Class)GKGameMatch;
  v8 = [(GKGameMatch *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_game, a4);
    v10 = [(GKRecentMatchInternal *)v9->_internal player];

    if (v10)
    {
      v11 = [(GKRecentMatchInternal *)v9->_internal player];
      uint64_t v12 = +[GKPlayer canonicalizedPlayerForInternal:v11];
      player = v9->_player;
      v9->_player = (GKPlayer *)v12;

      if (!v9->_game)
      {
        v14 = [(GKRecentMatchInternal *)v9->_internal game];

        if (v14)
        {
          v15 = [GKGameRecord alloc];
          v16 = [(GKRecentMatchInternal *)v9->_internal game];
          uint64_t v17 = [(GKGameRecord *)v15 initWithInternalRepresentation:v16 player:v9->_player];
          game = v9->_game;
          v9->_game = (GKGame *)v17;
        }
      }
    }
  }

  return v9;
}

- (GKGameMatch)init
{
  return [(GKGameMatch *)self initWithInternalRepresentation:0 game:0];
}

- (id)description
{
  v3 = [(GKGameMatch *)self player];
  v4 = [(GKGameMatch *)self game];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  id v7 = [v3 alias];
  v8 = [v4 name];
  v9 = [v5 stringWithFormat:@"<%@ %p> %@ %@ game:%@", v6, self, v3, v7, v8];

  return v9;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKGameMatch;
  v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKGameMatch;
  v5 = -[GKGameMatch methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(GKGameMatch *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKGameMatch;
  if (-[GKGameMatch respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKGameMatch *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      int v4 = GKApplicationLinkedOnOrAfter(393216, 657920);
      if (v4)
      {
        LOBYTE(v4) = +[GKRecentMatchInternal instancesRespondToSelector:a3];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  char v5 = [(GKGameMatch *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKGameMatch *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(GKGameMatch *)self internal];
    id v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKGameMatch *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (GKRecentMatchInternal)internal
{
  return (GKRecentMatchInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_game, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end