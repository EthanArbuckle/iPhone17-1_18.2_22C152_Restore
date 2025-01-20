@interface MTFrontendSimple
- (MTFEBuilder)builder;
- (MTFrontendSimple)initWithString:(id)a3;
- (MTFrontendSimple)initWithStringAndLocale:(id)a3 locale:(id)a4;
- (SLCFStringTextSource)fTextSource;
- (SLDictLookup)fDictLookup;
- (SLLexer)fLexer;
- (SLPronouncer)fPronouncer;
- (id)nextObject;
- (void)dealloc;
- (void)setBuilder:(MTFEBuilder *)a3;
- (void)setFDictLookup:(SLDictLookup *)a3;
- (void)setFLexer:(SLLexer *)a3;
- (void)setFPronouncer:(SLPronouncer *)a3;
- (void)setFTextSource:(SLCFStringTextSource *)a3;
@end

@implementation MTFrontendSimple

- (MTFrontendSimple)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en-US"];
  v6 = [(MTFrontendSimple *)self initWithStringAndLocale:v4 locale:v5];

  return v6;
}

- (MTFrontendSimple)initWithStringAndLocale:(id)a3 locale:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (SLDictLookup *)a4;
  v13.receiver = self;
  v13.super_class = (Class)MTFrontendSimple;
  v9 = [(MTFrontendSimple *)&v13 init];
  if (v9)
  {
    [(MTFrontendSimple *)v9 setFDictLookup:SLDictLookup::Create(v7, v8)];
    CFLocaleRef v10 = [(MTFrontendSimple *)v9 fDictLookup];
    [(MTFrontendSimple *)v9 setFPronouncer:SLPronouncer::Create((SLPronouncer *)v7, v10, v11)];
    operator new();
  }

  return 0;
}

- (id)nextObject
{
  MTFEBuilder::ParseSentence(self->_builder);
  builder = self->_builder;
  var2 = builder->var2;
  MTFEBuilder::ResetProduct(builder, 0);
  if (var2)
  {
    v5 = +[MTFWrappedSpeechElement fromCPPElement:var2];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(MTFrontendSimple *)self builder];
  if (v3) {
    (*((void (**)(MTFEBuilder *))v3->var0 + 1))(v3);
  }
  id v4 = [(MTFrontendSimple *)self fLexer];
  if (v4) {
    (*((void (**)(SLLexer *))v4->var0 + 7))(v4);
  }
  v5 = [(MTFrontendSimple *)self fPronouncer];
  if (v5) {
    (*((void (**)(SLPronouncer *))v5->var0 + 1))(v5);
  }
  id v6 = [(MTFrontendSimple *)self fDictLookup];
  if (v6) {
    (*((void (**)(SLDictLookup *))v6->var0 + 1))(v6);
  }
  v7 = [(MTFrontendSimple *)self fTextSource];
  if (v7) {
    (*((void (**)(SLCFStringTextSource *))v7->var0 + 2))(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTFrontendSimple;
  [(MTFrontendSimple *)&v8 dealloc];
}

- (MTFEBuilder)builder
{
  return self->_builder;
}

- (void)setBuilder:(MTFEBuilder *)a3
{
  self->_builder = a3;
}

- (SLLexer)fLexer
{
  return self->_fLexer;
}

- (void)setFLexer:(SLLexer *)a3
{
  self->_fLexer = a3;
}

- (SLDictLookup)fDictLookup
{
  return self->_fDictLookup;
}

- (void)setFDictLookup:(SLDictLookup *)a3
{
  self->_fDictLookup = a3;
}

- (SLPronouncer)fPronouncer
{
  return self->_fPronouncer;
}

- (void)setFPronouncer:(SLPronouncer *)a3
{
  self->_fPronouncer = a3;
}

- (SLCFStringTextSource)fTextSource
{
  return self->_fTextSource;
}

- (void)setFTextSource:(SLCFStringTextSource *)a3
{
  self->_fTextSource = a3;
}

@end