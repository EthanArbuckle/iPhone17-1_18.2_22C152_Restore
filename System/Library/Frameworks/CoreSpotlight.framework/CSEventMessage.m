@interface CSEventMessage
- (CSEventMessage)initWithMessage:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation CSEventMessage

- (CSEventMessage)initWithMessage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSEventMessage;
  v5 = [(CSEventMessage *)&v12 init];
  if (v5)
  {
    v5->_msg_id = xpc_dictionary_get_uint64(v4, "msg_id");
    v5->_journalIno = xpc_dictionary_get_uint64(v4, "j_ino");
    v5->_tocIno = xpc_dictionary_get_uint64(v4, "toc_ino");
    v5->_event = xpc_dictionary_get_uint64(v4, "je");
    unsigned int uint64 = xpc_dictionary_get_uint64(v4, "i_pc_pr");
    if (uint64)
    {
      int v8 = 5;
    }
    else
    {
      uint64_t v7 = (uint64 >> 1) - 1;
      if (v7 > 6) {
        int v8 = 0;
      }
      else {
        int v8 = dword_1000B69E0[v7];
      }
    }
    v5->_indexType = v8;
    v5->_journalNumber = xpc_dictionary_get_uint64(v4, "j_num");
    v5->_dev = xpc_dictionary_get_uint64(v4, "j_dev");
    v5->_toc_size = xpc_dictionary_get_uint64(v4, "toc_s");
    string = xpc_dictionary_get_string(v4, "j_name");
    v5->_journalName = string;
    if (string) {
      v5->_journalName = strdup(string);
    }
    v10 = xpc_dictionary_get_string(v4, "j_cookie");
    v5->_journalCookie = v10;
    if (v10) {
      v5->_journalCookie = strdup(v10);
    }
  }

  return v5;
}

- (id)description
{
  bzero(__str, 0x400uLL);
  int v3 = snprintf(__str, 0x400uLL, "<CSEventMessage: %p;", self);
  id v4 = &__str[v3 + snprintf(&__str[v3], 1024 - v3, " msg: %llu", self->_msg_id)];
  unsigned int event = self->_event;
  if (event >= 5) {
    int v6 = 5;
  }
  else {
    int v6 = self->_event;
  }
  uint64_t v7 = &v4[snprintf(v4, (char *)&v15 - v4, " evt: %s (%d)", off_1000DB968[v6], event)];
  int v8 = sub_100005F74(self->_indexType);
  v9 = &v7[snprintf(v7, (char *)&v15 - v7, " type: %s", v8)];
  journalName = self->_journalName;
  if (journalName && *journalName) {
    v9 += snprintf(v9, (char *)&v15 - v9, " name: %s", self->_journalName);
  }
  journalCookie = self->_journalCookie;
  if (journalCookie && *journalCookie) {
    v9 += snprintf(v9, (char *)&v15 - v9, " cookie: %s", self->_journalCookie);
  }
  if (self->_journalNumber) {
    v9 += snprintf(v9, (char *)&v15 - v9, " num: %llu", self->_journalNumber);
  }
  if (self->_dev) {
    v9 += snprintf(v9, (char *)&v15 - v9, " dev: %u", self->_dev);
  }
  if (self->_journalIno) {
    v9 += snprintf(v9, (char *)&v15 - v9, " jino: %llu", self->_journalIno);
  }
  if (self->_tocIno) {
    v9 += snprintf(v9, (char *)&v15 - v9, " tino: %llu", self->_tocIno);
  }
  if (self->_toc_size) {
    v9 += snprintf(v9, (char *)&v15 - v9, " tocsz: %llu", self->_toc_size);
  }
  snprintf(v9, (char *)&v15 - v9, ">");
  objc_super v12 = +[NSString stringWithUTF8String:__str];

  return v12;
}

- (void)dealloc
{
  free((void *)self->_journalName);
  free((void *)self->_journalCookie);
  v3.receiver = self;
  v3.super_class = (Class)CSEventMessage;
  [(CSEventMessage *)&v3 dealloc];
}

@end