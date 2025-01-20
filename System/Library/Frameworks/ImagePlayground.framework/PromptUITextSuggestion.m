@interface PromptUITextSuggestion
- (_TtC15ImagePlayground22PromptUITextSuggestion)init;
- (_TtC15ImagePlayground22PromptUITextSuggestion)initWithCoder:(id)a3;
@end

@implementation PromptUITextSuggestion

- (_TtC15ImagePlayground22PromptUITextSuggestion)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC15ImagePlayground22PromptUITextSuggestion_representedObject;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(UITextSuggestion *)&v6 init];
}

- (_TtC15ImagePlayground22PromptUITextSuggestion)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v6 = (char *)self + OBJC_IVAR____TtC15ImagePlayground22PromptUITextSuggestion_representedObject;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(UITextSuggestion *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end