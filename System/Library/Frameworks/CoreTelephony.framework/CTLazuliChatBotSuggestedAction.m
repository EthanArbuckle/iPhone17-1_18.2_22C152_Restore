@interface CTLazuliChatBotSuggestedAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSuggestedAction:(id)a3;
- (CTLazuliChatBotSuggestedAction)initWithCoder:(id)a3;
- (CTLazuliChatBotSuggestedAction)initWithReflection:(const void *)a3;
- (CTLazuliChatBotSuggestion)suggestion;
- (id)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliChatBotSuggestedAction

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliChatBotSuggestedAction *)self type];
  int64_t v7 = [(CTLazuliChatBotSuggestedAction *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliSuggestedActionType(&v7)];
  v5 = [(CTLazuliChatBotSuggestedAction *)self suggestion];
  [v3 appendFormat:@", suggestion = %@", v5];

  [v3 appendFormat:@", action {%@} = %@", objc_opt_class(), self->_action];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedAction:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliChatBotSuggestedAction *)self type];
  if (v5 == [v4 type]
    && ([(CTLazuliChatBotSuggestedAction *)self suggestion],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v4 suggestion],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqualToCTLazuliChatBotSuggestion:v7],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    switch(self->_type)
    {
      case 0:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionOpenUrlInWebView:v10];
        goto LABEL_19;
      case 1:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionOpenUrlInApplication:v10];
        goto LABEL_19;
      case 2:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionComposeText:v10];
        goto LABEL_19;
      case 3:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionComposeAudioRecording:v10];
        goto LABEL_19;
      case 4:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionComposeVideoRecording:v10];
        goto LABEL_19;
      case 5:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionShowLocation:v10];
        goto LABEL_19;
      case 6:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionRequestLocationPush:v10];
        goto LABEL_19;
      case 7:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionCalendar:v10];
        goto LABEL_19;
      case 8:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionDialVideoCall:v10];
        goto LABEL_19;
      case 9:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionDialEnrichedCall:v10];
        goto LABEL_19;
      case 0xALL:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionDialPhoneNumber:v10];
        goto LABEL_19;
      case 0xBLL:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionDevice:v10];
        goto LABEL_19;
      case 0xCLL:
        v9 = [(CTLazuliChatBotSuggestedAction *)self action];
        v10 = [v4 action];
        char v11 = [v9 isEqualToCTLazuliSuggestedActionSettings:v10];
LABEL_19:
        BOOL v12 = v11;

        break;
      default:
        BOOL v12 = 1;
        break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotSuggestedAction *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSuggestedAction *)self isEqualToCTLazuliChatBotSuggestedAction:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotSuggestedAction allocWithZone:a3];
  [(CTLazuliChatBotSuggestedAction *)v4 setType:self->_type];
  [(CTLazuliChatBotSuggestedAction *)v4 setSuggestion:self->_suggestion];
  [(CTLazuliChatBotSuggestedAction *)v4 setAction:self->_action];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];

  [v5 encodeObject:self->_suggestion forKey:@"kSuggestionKey"];
  [v5 encodeObject:self->_action forKey:@"kActionKey"];
}

- (CTLazuliChatBotSuggestedAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CTLazuliChatBotSuggestedAction;
  id v5 = [(CTLazuliChatBotSuggestedAction *)&v27 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSuggestionKey"];
    suggestion = v5->_suggestion;
    v5->_suggestion = (CTLazuliChatBotSuggestion *)v7;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v26, "setWithObjects:", v25, v24, v23, v22, v21, v20, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kActionKey"];
    id action = v5->_action;
    v5->_id action = (id)v17;
  }
  return v5;
}

- (CTLazuliChatBotSuggestedAction)initWithReflection:(const void *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CTLazuliChatBotSuggestedAction;
  id v4 = [(CTLazuliChatBotSuggestedAction *)&v34 init];
  if (v4)
  {
    v4->_type = encode_CTLazuliSuggestedActionType((unsigned int *)a3);
    id v5 = [[CTLazuliChatBotSuggestion alloc] initWithReflection:(char *)a3 + 8];
    suggestion = v4->_suggestion;
    v4->_suggestion = v5;

    switch(*((_DWORD *)a3 + 52))
    {
      case 0:
        *(void *)&long long v28 = 0;
        memset(__p, 0, sizeof(__p));
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        if (*((char *)a3 + 103) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p[0].__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 10), *((void *)a3 + 11));
        }
        else
        {
          *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = *((_OWORD *)a3 + 5);
          __p[1].__r_.__value_.__r.__words[0] = *((void *)a3 + 12);
        }
        if (*((char *)a3 + 127) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p[1].__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 13), *((void *)a3 + 14));
        }
        else
        {
          *(_OWORD *)&__p[1].__r_.__value_.__r.__words[1] = *(_OWORD *)((char *)a3 + 104);
          *(void *)&long long v28 = *((void *)a3 + 15);
        }
        uint64_t v24 = [[CTLazuliSuggestedActionOpenUrlInWebView alloc] initWithReflection:__p];
        id action = v4->_action;
        v4->_id action = v24;

        if (SBYTE7(v28) < 0) {
          operator delete((void *)__p[1].__r_.__value_.__l.__size_);
        }
        if (__p[1].__r_.__value_.__s.__data_[7] < 0)
        {
          size = (void *)__p[0].__r_.__value_.__l.__size_;
          goto LABEL_37;
        }
        return v4;
      case 1:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0) {
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((void *)a3 + 10));
        }
        else {
          __p[0] = *(std::string *)((unsigned char *)a3 + 3);
        }
        v19 = [[CTLazuliSuggestedActionOpenUrlInApplication alloc] initWithReflection:__p];
        goto LABEL_34;
      case 2:
        memset(__p, 0, sizeof(__p));
        if (*((char *)a3 + 95) < 0) {
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((void *)a3 + 10));
        }
        else {
          __p[0] = *(std::string *)((unsigned char *)a3 + 3);
        }
        if (*((char *)a3 + 119) < 0) {
          std::string::__init_copy_ctor_external(&__p[1], *((const std::string::value_type **)a3 + 12), *((void *)a3 + 13));
        }
        else {
          __p[1] = *(std::string *)((unsigned char *)a3 + 4);
        }
        uint64_t v22 = [[CTLazuliSuggestedActionComposeText alloc] initWithReflection:__p];
        id v23 = v4->_action;
        v4->_id action = v22;

        if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p[1].__r_.__value_.__l.__data_);
        }
        goto LABEL_35;
      case 3:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0) {
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((void *)a3 + 10));
        }
        else {
          __p[0] = *(std::string *)((unsigned char *)a3 + 3);
        }
        v19 = [[CTLazuliSuggestedActionComposeAudioRecording alloc] initWithReflection:__p];
        goto LABEL_34;
      case 4:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0) {
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((void *)a3 + 10));
        }
        else {
          __p[0] = *(std::string *)((unsigned char *)a3 + 3);
        }
        v19 = [[CTLazuliSuggestedActionComposeVideoRecording alloc] initWithReflection:__p];
LABEL_34:
        id v20 = v4->_action;
        v4->_id action = v19;

LABEL_35:
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        {
          size = (void *)__p[0].__r_.__value_.__r.__words[0];
LABEL_37:
          operator delete(size);
        }
        return v4;
      case 5:
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v28 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionShowLocation::SuggestedActionShowLocation((Lazuli::SuggestedActionShowLocation *)__p, (const Lazuli::SuggestedActionShowLocation *)((char *)a3 + 72));
        uint64_t v7 = [[CTLazuliSuggestedActionShowLocation alloc] initWithReflection:__p];
        id v8 = v4->_action;
        v4->_id action = v7;

        Lazuli::SuggestedActionShowLocation::~SuggestedActionShowLocation((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 6:
        __p[0].__r_.__value_.__s.__data_[0] = *((unsigned char *)a3 + 72);
        uint64_t v9 = [[CTLazuliSuggestedActionRequestLocationPush alloc] initWithReflection:__p];
        goto LABEL_21;
      case 7:
        uint64_t v33 = 0;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v28 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::ChatBotCreateCalendarEvent::ChatBotCreateCalendarEvent(__p, (long long *)((char *)a3 + 72));
        uint64_t v10 = [[CTLazuliSuggestedActionCalendar alloc] initWithReflection:__p];
        id v11 = v4->_action;
        v4->_id action = v10;

        Lazuli::SuggestedActionCalendar::~SuggestedActionCalendar((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 8:
        *(void *)&long long v28 = 0;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialVideoCall::SuggestedActionDialVideoCall(__p, (const Lazuli::SuggestedActionDialVideoCall *)((char *)a3 + 72));
        uint64_t v12 = [[CTLazuliSuggestedActionDialVideoCall alloc] initWithReflection:__p];
        id v13 = v4->_action;
        v4->_id action = v12;

        Lazuli::SuggestedActionDialVideoCall::~SuggestedActionDialVideoCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 9:
        *(void *)&long long v30 = 0;
        long long v28 = 0u;
        long long v29 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialEnrichedCall::SuggestedActionDialEnrichedCall(__p, (const Lazuli::SuggestedActionDialEnrichedCall *)((char *)a3 + 72));
        uint64_t v14 = [[CTLazuliSuggestedActionDialEnrichedCall alloc] initWithReflection:__p];
        id v15 = v4->_action;
        v4->_id action = v14;

        Lazuli::SuggestedActionDialEnrichedCall::~SuggestedActionDialEnrichedCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 0xA:
        *(void *)&long long v28 = 0;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialPhoneNumber::SuggestedActionDialPhoneNumber(__p, (long long *)((char *)a3 + 72));
        v16 = [[CTLazuliSuggestedActionDialPhoneNumber alloc] initWithReflection:__p];
        id v17 = v4->_action;
        v4->_id action = v16;

        Lazuli::SuggestedActionDialVideoCall::~SuggestedActionDialVideoCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 0xB:
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        uint64_t v9 = [[CTLazuliSuggestedActionDevice alloc] initWithReflection:__p];
        goto LABEL_21;
      case 0xC:
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        uint64_t v9 = [[CTLazuliSuggestedActionSettings alloc] initWithReflection:__p];
LABEL_21:
        id v18 = v4->_action;
        v4->_id action = v9;

        break;
      default:
        return v4;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CTLazuliChatBotSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end