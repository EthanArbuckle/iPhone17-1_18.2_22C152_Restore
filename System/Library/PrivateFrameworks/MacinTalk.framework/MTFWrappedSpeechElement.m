@interface MTFWrappedSpeechElement
+ (id)fromCPPElement:(void *)a3;
- (BOOL)unOwned;
- (MTFWrappedSpeechElement)FirstChild;
- (MTFWrappedSpeechElement)LastChild;
- (MTFWrappedSpeechElement)NextSibling;
- (MTFWrappedSpeechElement)Parent;
- (MTFWrappedSpeechElement)PrevSibling;
- (MTFWrappedSpeechElement)initWithCppElement:(void *)a3;
- (int)NumChildren;
- (void)dealloc;
- (void)setUnOwned:(BOOL)a3;
- (void)setWrapped:(void *)a3;
- (void)wrapped;
@end

@implementation MTFWrappedSpeechElement

- (MTFWrappedSpeechElement)initWithCppElement:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTFWrappedSpeechElement;
  v4 = [(MTFWrappedSpeechElement *)&v7 init];
  v5 = v4;
  if (v4) {
    [(MTFWrappedSpeechElement *)v4 setWrapped:a3];
  }
  return v5;
}

- (MTFWrappedSpeechElement)FirstChild
{
  v2 = +[MTFWrappedSpeechElement fromCPPElement:(void)[(MTFWrappedSpeechElement *)self elem][16]];
  [v2 setUnOwned:1];

  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)LastChild
{
  v2 = +[MTFWrappedSpeechElement fromCPPElement:(void)[(MTFWrappedSpeechElement *)self elem][24]];
  [v2 setUnOwned:1];

  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)Parent
{
  v2 = +[MTFWrappedSpeechElement fromCPPElement:(void)[(MTFWrappedSpeechElement *)self elem][32]];
  [v2 setUnOwned:1];

  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)NextSibling
{
  v2 = +[MTFWrappedSpeechElement fromCPPElement:(void)[(MTFWrappedSpeechElement *)self elem][40]];
  [v2 setUnOwned:1];

  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)PrevSibling
{
  v2 = +[MTFWrappedSpeechElement fromCPPElement:(void)[(MTFWrappedSpeechElement *)self elem][48]];
  [v2 setUnOwned:1];

  return (MTFWrappedSpeechElement *)v2;
}

+ (id)fromCPPElement:(void *)a3
{
  if (a3)
  {
    if (v5)
    {
      v6 = v5;
      objc_super v7 = off_1E6BC5910;
    }
    else
    {
      if (v10)
      {
        v6 = v10;
        objc_super v7 = off_1E6BC5900;
      }
      else
      {
        if (v11)
        {
          v6 = v11;
          objc_super v7 = off_1E6BC58F8;
        }
        else
        {
          if (v12)
          {
            v6 = v12;
            objc_super v7 = off_1E6BC5928;
          }
          else
          {
            if (v13)
            {
              v6 = v13;
              objc_super v7 = off_1E6BC58F0;
            }
            else
            {
              if (v14)
              {
                v6 = v14;
                objc_super v7 = off_1E6BC5920;
              }
              else
              {
                if (v15)
                {
                  v6 = v15;
                  objc_super v7 = off_1E6BC5908;
                }
                else
                {
                  objc_super v7 = off_1E6BC58E8;
                  if (v16)
                  {
                    v6 = v16;
                  }
                  else
                  {
                    objc_super v7 = off_1E6BC5918;
                    v6 = a3;
                  }
                }
              }
            }
          }
        }
      }
    }
    v8 = (void *)[objc_alloc(*v7) initWithCppElement:v6];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)dealloc
{
  if (![(MTFWrappedSpeechElement *)self unOwned])
  {
    uint64_t v3 = [(MTFWrappedSpeechElement *)self elem];
    if (v3) {
      (*((void (**)(MTFESpeechElement *))v3->var0 + 2))(v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MTFWrappedSpeechElement;
  [(MTFWrappedSpeechElement *)&v4 dealloc];
}

- (void)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(void *)a3
{
  self->_wrapped = a3;
}

- (BOOL)unOwned
{
  return self->_unOwned;
}

- (void)setUnOwned:(BOOL)a3
{
  self->_unOwned = a3;
}

- (int)NumChildren
{
  return self->_NumChildren;
}

@end