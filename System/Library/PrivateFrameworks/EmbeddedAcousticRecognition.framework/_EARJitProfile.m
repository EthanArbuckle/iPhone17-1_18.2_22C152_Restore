@interface _EARJitProfile
- (_EARJitProfile)initWithConfiguration:(id)a3 ncsRoot:(id)a4 language:(id)a5;
- (id)jitProfileFromContextualStrings:(id)a3;
@end

@implementation _EARJitProfile

- (_EARJitProfile)initWithConfiguration:(id)a3 ncsRoot:(id)a4 language:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_EARJitProfile;
  v11 = [(_EARJitProfile *)&v22 init];
  if (!v11) {
    goto LABEL_3;
  }
  v12 = [v9 stringByAppendingPathComponent:@"en_US_napg.json"];
  v13 = [v9 stringByAppendingPathComponent:@"vocdelta.voc"];
  v14 = [v9 stringByAppendingPathComponent:@"pg.voc"];
  v15 = [v9 stringByAppendingPathComponent:@"mrec.psh"];
  LOBYTE(v21) = 1;
  v16 = [(_EARUserProfileBuilder *)[_EARUserProfile alloc] initWithConfiguration:v8 language:v10 overrides:0 sdapiOverrides:v12 emptyVoc:v13 pgVoc:v14 paramsetHolder:v15 isJit:v21];
  profileBuilder = v11->_profileBuilder;
  v11->_profileBuilder = &v16->super;

  v18 = v11->_profileBuilder;
  if (!v18) {
    v19 = 0;
  }
  else {
LABEL_3:
  }
    v19 = v11;

  return v19;
}

- (id)jitProfileFromContextualStrings:(id)a3
{
  id v4 = a3;
  [(_EARUserProfileBuilder *)self->_profileBuilder createInlineLmeUserDataForContextStrings:v4];
  v5 = [(_EARUserProfileBuilder *)self->_profileBuilder dataProfile];

  return v5;
}

- (void).cxx_destruct
{
}

@end