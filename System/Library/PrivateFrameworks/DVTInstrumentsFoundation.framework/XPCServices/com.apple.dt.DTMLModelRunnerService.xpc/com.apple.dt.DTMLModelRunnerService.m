int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.dt.DTMLModelRunnerService", "CoreMLPerf");
  v4 = off_10003C8E8;
  off_10003C8E8 = v3;

  v5 = off_10003C8E8;
  if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CoreML: (XPC) Started XPC service", v6, 2u);
  }
  xpc_main((xpc_connection_handler_t)sub_100004868);
}

void sub_100004868(void *a1)
{
  id v1 = a1;
  v2 = off_10003C8E8;
  if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CoreML: (XPC) creating event handler", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004940;
  handler[3] = &unk_100038F68;
  id v5 = v1;
  v3 = (_xpc_connection_s *)v1;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume(v3);
}

void sub_100004940(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = off_10003C8E8;
  if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler fired", (uint8_t *)&buf, 2u);
  }
  xpc_type_t type = xpc_get_type(v3);
  v6 = off_10003C8E8;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_ERROR)) {
      sub_10002BD1C(v6);
    }
  }
  else
  {
    xpc_type_t v7 = type;
    if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler no error", (uint8_t *)&buf, 2u);
    }
    if (v7 != (xpc_type_t)&_xpc_type_dictionary) {
      sub_10002BF04();
    }
    v8 = off_10003C8E8;
    if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler asserted dictionary", (uint8_t *)&buf, 2u);
    }
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    string = xpc_dictionary_get_string(v10, "command");
    if (!string)
    {
      v60 = off_10003C8E8;
      if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_ERROR)) {
        sub_10002BD60(v60, v61, v62, v63, v64, v65, v66, v67);
      }
      exit(101);
    }
    v12 = string;
    if (!strcmp(string, "getPID"))
    {
      id v36 = v10;
      v37 = (_xpc_connection_s *)v9;
      pid_t pid = xpc_connection_get_pid(v37);
      v39 = off_10003C8E8;
      if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = pid;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "CoreML: (XPC) getPID - PID is %i", (uint8_t *)&buf, 8u);
        v39 = off_10003C8E8;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler creating reply", (uint8_t *)&buf, 2u);
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v36);

      xpc_dictionary_set_int64(reply, "pid", pid);
      xpc_connection_send_message(v37, reply);

      v41 = off_10003C8E8;
      if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "CoreML: (XPC) about to SIGSTOP", (uint8_t *)&buf, 2u);
      }
      pid_t v42 = getpid();
      kill(v42, 17);
      v43 = off_10003C8E8;
      if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "CoreML: (XPC) did SIGSTOP", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      if (strcmp(v12, "profile"))
      {
        v68 = off_10003C8E8;
        if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_ERROR)) {
          sub_10002BEC0(v68);
        }
        exit(102);
      }
      v13 = (_xpc_connection_s *)v9;
      id v14 = v10;
      pid_t v15 = xpc_connection_get_pid(v13);
      v16 = off_10003C8E8;
      if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CoreML: (XPC) profile command - PID is %i", (uint8_t *)&buf, 8u);
      }
      v17 = xpc_dictionary_get_string(v14, "modelFileName");
      if (v17)
      {
        v18 = v17;
        v19 = xpc_dictionary_get_string(v14, "containerGUID");
        if (v19)
        {
          v72 = v19;
          pid_t v71 = v15;
          int64_t int64 = xpc_dictionary_get_int64(v14, "computeUnit");
          v20 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = int64;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CoreML: (XPC) received computeUnit value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v77 = xpc_dictionary_get_int64(v14, "experimentIterations");
          v21 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v77;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CoreML: (XPC) received experimentIterations value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v76 = xpc_dictionary_get_int64(v14, "loadCount");
          v22 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v76;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CoreML: (XPC) received loadCount value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v75 = xpc_dictionary_get_int64(v14, "predictionCount");
          v23 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v75;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CoreML: (XPC) received predictionCount value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v74 = xpc_dictionary_get_int64(v14, "maxPredictionTime");
          v24 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v74;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CoreML: (XPC) received maxPredictionTime value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v25 = xpc_dictionary_get_int64(v14, "maxIterationTime");
          v26 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CoreML: (XPC) received maxIterationTime value: %ld", (uint8_t *)&buf, 0xCu);
          }
          int64_t v69 = v25;
          v27 = (void *)xpc_dictionary_get_string(v14, "functionName");
          v28 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "CoreML: (XPC) received functionName value: '%s'", (uint8_t *)&buf, 0xCu);
          }
          v29 = +[NSString stringWithFormat:@"%s", v18];
          uint64_t v30 = +[NSString stringWithFormat:@"%s", v72];
          if (v27)
          {
            v27 = +[NSString stringWithFormat:@"%s", v27];
          }
          id v73 = v9;
          v70 = (void *)v30;
          id v31 = [objc_alloc((Class)NSUUID) initWithUUIDString:v30];
          v32 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "CoreML: (XPC) initializing PerfRunner", (uint8_t *)&buf, 2u);
          }
          v33 = [[_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig alloc] initWithExperimentIterations:v77 loadCount:v76 predictionCount:v75 maxPredictionTime:v74 maxIterationTime:v69 functionName:v27];
          v34 = [[_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation alloc] initWithTempFolderGuid:v31 fileName:v29];
          v35 = [[_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner alloc] initWithConfig:v33];
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          v80 = sub_1000051EC;
          v81 = &unk_100038F90;
          id v82 = v14;
          pid_t v84 = v71;
          v83 = v13;
          [(PerfRunner *)v35 runWithModelLocation:v34 computeUnits:int64 perfRunConfig:v33 completionHandler:&buf];

          id v9 = v73;
        }
        else
        {
          v52 = off_10003C8E8;
          if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_ERROR)) {
            sub_10002BE48(v52, v53, v54, v55, v56, v57, v58, v59);
          }
        }
      }
      else
      {
        v44 = off_10003C8E8;
        if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_ERROR)) {
          sub_10002BDD0(v44, v45, v46, v47, v48, v49, v50, v51);
        }
      }
    }
  }
}

void sub_1000051EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = off_10003C8E8;
  if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler creating reply", buf, 2u);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v6 = v3;
  xpc_dictionary_set_string(reply, "timerData", (const char *)[v6 UTF8String]);
  xpc_dictionary_set_int64(reply, "pid", *(int *)(a1 + 48));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_type_t v7 = off_10003C8E8;
  if (os_log_type_enabled((os_log_t)off_10003C8E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler sent reply", v8, 2u);
  }
}

void sub_1000052F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005314()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    uint64_t v2 = sub_10002C480();
    uint64_t v4 = v3;

    qword_10003C8F8 = v2;
    unk_10003C900 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000053A0()
{
  sub_10000D040(0, &qword_10003CA18);
  if (qword_10003C8F0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10002C640();
  qword_10003D878 = result;
  return result;
}

uint64_t sub_100005450()
{
  uint64_t v0 = sub_10002C0D0();
  sub_10000A958(v0, qword_10003D880);
  sub_10000A920(v0, (uint64_t)qword_10003D880);
  if (qword_10003C8F0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_10002C0C0();
}

uint64_t sub_10000550C()
{
  uint64_t v0 = sub_10002C0D0();
  sub_10000A958(v0, qword_10003C920);
  uint64_t v1 = sub_10000A920(v0, (uint64_t)qword_10003C920);
  if (qword_10003C910 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000A920(v0, (uint64_t)qword_10003D880);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_10000569C()
{
  uint64_t v1 = v0;
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  sub_100008BE0(&qword_10003CA28);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002D3D0;
  uint64_t v3 = sub_10002C8E0();
  uint64_t v5 = v4;
  *(void *)(v2 + 56) = &type metadata for String;
  unint64_t v6 = sub_10000A8CC();
  *(void *)(v2 + 64) = v6;
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v5;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10002C5F0();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10002D3D0;
  uint64_t v8 = sub_10002C8E0();
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = v6;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10002C5F0();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10002D3D0;
  uint64_t v11 = sub_10002C8E0();
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = v6;
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v12;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10002C5F0();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10002D3D0;
  uint64_t v14 = sub_10002C8E0();
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = v6;
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v15;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10002C5F0();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10002D3D0;
  uint64_t v17 = sub_10002C8E0();
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = v6;
  *(void *)(v16 + 32) = v17;
  *(void *)(v16 + 40) = v18;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10002C5F0();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10002D3D0;
  uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName);
  unint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName + 8);
  *(void *)(v19 + 56) = &type metadata for String;
  *(void *)(v19 + 64) = v6;
  uint64_t v22 = 0x296C6C756E28;
  if (v20) {
    uint64_t v22 = v21;
  }
  unint64_t v23 = 0xE600000000000000;
  if (v20) {
    unint64_t v23 = v20;
  }
  *(void *)(v19 + 32) = v22;
  *(void *)(v19 + 40) = v23;
  swift_bridgeObjectRetain();
  sub_10002C0A0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_100005AC0(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E756F4364616F6CLL;
      break;
    case 2:
      unint64_t result = 0x6974636964657270;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x6E6F6974636E7566;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100005BB8()
{
  return sub_100005AC0(*v0);
}

uint64_t sub_100005BC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009ED8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100005BE8()
{
  return 0;
}

void sub_100005BF4(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100005C00(uint64_t a1)
{
  unint64_t v2 = sub_10000D850();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005C3C(uint64_t a1)
{
  unint64_t v2 = sub_10000D850();
  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_100005C78()
{
  return sub_1000086DC(type metadata accessor for PerfRunConfig);
}

uint64_t type metadata accessor for PerfRunConfig()
{
  return self;
}

uint64_t sub_100005CC8(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003CB40);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  unint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100008C24(a1, a1[3]);
  sub_10000D850();
  sub_10002C9B0();
  v8[15] = 0;
  sub_10002C8C0();
  if (!v1)
  {
    v8[14] = 1;
    sub_10002C8C0();
    v8[13] = 2;
    sub_10002C8C0();
    v8[12] = 3;
    sub_10002C8C0();
    v8[11] = 4;
    sub_10002C8C0();
    v8[10] = 5;
    sub_10002C850();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100005EFC(void *a1)
{
  return sub_100005CC8(a1);
}

BOOL sub_100005F20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100005F34()
{
  sub_10002C980(*v0);
}

uint64_t sub_100005F70(char a1)
{
  if (a1) {
    return 0x73654D726F727265;
  }
  else {
    return 0x646F43726F727265;
  }
}

uint64_t sub_100005FB4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[1] = a4;
  uint64_t v6 = sub_100008BE0(&qword_10003CBC0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10000E1D0();
  sub_10002C9B0();
  char v13 = 0;
  sub_10002C8A0();
  if (!v4)
  {
    char v12 = 1;
    sub_10002C880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

BOOL sub_100006128(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100006140()
{
  Swift::UInt v1 = *v0;
  sub_10002C970();
  sub_10002C980(v1);
  return sub_10002C990();
}

Swift::Int sub_100006188()
{
  Swift::UInt v1 = *v0;
  sub_10002C970();
  sub_10002C980(v1);
  return sub_10002C990();
}

uint64_t sub_1000061CC()
{
  return sub_100005F70(*v0);
}

uint64_t sub_1000061D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000A164(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000061FC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100006208(uint64_t a1)
{
  unint64_t v2 = sub_10000E1D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006244(uint64_t a1)
{
  unint64_t v2 = sub_10000E1D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006280(void *a1)
{
  return sub_100005FB4(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_1000062A0(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C69706D6F63;
      break;
    case 2:
      unint64_t result = 1684107116;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x7274536C65646F6DLL;
      break;
    case 5:
      unint64_t result = 0x436E755266726570;
      break;
    default:
      unint64_t result = 0x74636964657270;
      break;
  }
  return result;
}

uint64_t sub_100006380(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100008BE0(&qword_10003C9D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100008C68();
  sub_10002C9B0();
  v11[0] = *v3;
  char v12 = 0;
  type metadata accessor for SampleTimer();
  sub_100008E7C(&qword_10003C9E8, 255, (void (*)(uint64_t))type metadata accessor for SampleTimer);
  sub_10002C8B0();
  if (!v2)
  {
    v11[0] = v3[1];
    char v12 = 1;
    sub_10002C8B0();
    v11[0] = v3[2];
    char v12 = 2;
    sub_10002C8B0();
    v11[0] = v3[3];
    char v12 = 3;
    sub_100008BE0(&qword_10003C9F0);
    sub_100008CBC();
    sub_10002C8B0();
    sub_100008DCC((uint64_t)(v3 + 4), (uint64_t)v13);
    sub_100008DCC((uint64_t)v13, (uint64_t)v11);
    char v12 = 4;
    sub_100008E28();
    sub_10002C8B0();
    v11[0] = v3[7];
    char v12 = 5;
    type metadata accessor for PerfRunConfig();
    sub_100008E7C(&qword_10003CA10, v9, (void (*)(uint64_t))type metadata accessor for PerfRunConfig);
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100006690()
{
  return sub_1000062A0(*v0);
}

uint64_t sub_100006698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000A3D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000066C0(uint64_t a1)
{
  unint64_t v2 = sub_100008C68();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000066FC(uint64_t a1)
{
  unint64_t v2 = sub_100008C68();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006738(void *a1)
{
  return sub_100006380(a1);
}

uint64_t sub_1000067FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  uint64_t v5 = sub_10002C030();
  v4[14] = v5;
  v4[15] = *(void *)(v5 - 8);
  v4[16] = swift_task_alloc();
  return _swift_task_switch(sub_1000068C0, 0, 0);
}

uint64_t sub_1000068C0()
{
  if (qword_10003C918 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10002C0D0();
  sub_10000A920(v1, (uint64_t)qword_10003C920);
  os_log_type_t v2 = sub_10002C5F0();
  uint64_t v3 = sub_10002C0B0();
  if (os_log_type_enabled(v3, v2))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "starting PerfRunner.run with layer schedule support", v4, 2u);
    swift_slowDealloc();
  }

  sub_10000569C();
  sub_10002B8DC();
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  uint64_t v5 = v0[11];
  v0[17] = sub_100008BE0(&qword_10003CA28);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10002D3D0;
  uint64_t v7 = sub_10002C020();
  uint64_t v9 = v8;
  *(void *)(v6 + 56) = &type metadata for String;
  unint64_t v10 = sub_10000A8CC();
  v0[18] = v10;
  *(void *)(v6 + 64) = v10;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_10000A64C(v5);
  os_log_type_t v12 = sub_10002C5F0();
  char v13 = sub_10002C0B0();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v12, "PerfRunner.run finished unwrapping unit", v14, 2u);
    swift_slowDealloc();
  }

  uint64_t v15 = (void *)swift_task_alloc();
  v0[19] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_100006B9C;
  uint64_t v16 = v0[16];
  uint64_t v17 = v0[12];
  return sub_10000AECC((uint64_t)(v0 + 2), v16, v11, v17);
}

uint64_t sub_100006B9C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_100006E48;
  }
  else
  {
    sub_10000CDD0(v2 + 16);
    uint64_t v3 = sub_100006CB8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100006CB8()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = sub_10000C768((_OWORD *)(v0 + 16));
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    sub_10000CE54(v0 + 16);
    sub_10000C9E4();
    unint64_t v4 = sub_10000CBD4();
    uint64_t v6 = v5;
    swift_errorRelease();
  }
  else
  {
    unint64_t v4 = (unint64_t)v2;
    uint64_t v6 = v3;
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v8 = *(void *)(v0 + 120);
    uint64_t v13 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 112);
    sub_10002C5F0();
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10002D3D0;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = v7;
    *(void *)(v10 + 32) = v4;
    *(void *)(v10 + 40) = v6;
    swift_bridgeObjectRetain();
    sub_10002C0A0();
    swift_bridgeObjectRelease();
    sub_10000CE54(v0 + 16);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v9);
  }
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 8);
  return v11(v4, v6);
}

uint64_t sub_100006E48()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  sub_10000C9E4();
  unint64_t v1 = sub_10000CBD4();
  uint64_t v3 = v2;
  swift_errorRelease();
  swift_task_dealloc();
  unint64_t v4 = (uint64_t (*)(unint64_t, uint64_t))v0[1];
  return v4(v1, v3);
}

uint64_t sub_100007088(void *a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[3] = a3;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  id v10 = a1;
  id v11 = a3;
  a5;
  os_log_type_t v12 = (void *)swift_task_alloc();
  v5[6] = v12;
  void *v12 = v5;
  v12[1] = sub_100007170;
  return sub_1000067FC((uint64_t)v10, a2, (uint64_t)v11);
}

uint64_t sub_100007170()
{
  unint64_t v1 = *(void (***)(void, void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  unint64_t v4 = *(void **)(*v0 + 16);
  uint64_t v8 = *v0;
  swift_task_dealloc();

  NSString v5 = sub_10002C450();
  swift_bridgeObjectRelease();
  ((void (**)(void, NSString))v1)[2](v1, v5);

  _Block_release(v1);
  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_100007310(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return _swift_task_switch(sub_100007334, 0, 0);
}

uint64_t sub_100007334()
{
  if (qword_10003C918 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10002C0D0();
  v0[11] = sub_10000A920(v1, (uint64_t)qword_10003C920);
  os_log_type_t v2 = sub_10002C5F0();
  uint64_t v3 = sub_10002C0B0();
  if (os_log_type_enabled(v3, v2))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "Gathering MLComputePlan from model", v4, 2u);
    swift_slowDealloc();
  }
  NSString v5 = (void *)v0[9];

  sub_10002C1E0();
  [v5 copy];
  sub_10002C660();
  swift_unknownObjectRelease();
  sub_10000D040(0, &qword_10003CA38);
  swift_dynamicCast();
  uint64_t v6 = (void *)v0[6];
  v0[12] = v6;
  [v6 setProfilingOptions:1];
  uint64_t v7 = (void *)swift_task_alloc();
  v0[13] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100007520;
  uint64_t v8 = v0[8];
  return static MLComputePlan.load(contentsOf:configuration:)(v8, v6);
}

uint64_t sub_100007520(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v4 = sub_100007750;
  }
  else
  {

    unint64_t v4 = sub_10000763C;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000763C()
{
  os_log_type_t v1 = sub_10002C5F0();
  os_log_type_t v2 = sub_10002C0B0();
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v1, "Building ModelStructure from MLComputePlan", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[10];

  uint64_t v6 = sub_10001CD18(v4);
  uint64_t v7 = v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32);
  uint64_t v9 = *(void *)(v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40);
  *(void *)(v7 + 32) = v6;
  *(void *)(v7 + 40) = v10;
  unsigned __int8 v11 = *(unsigned char *)(v7 + 48);
  *(unsigned char *)(v7 + 48) = v12;
  sub_1000088C0(v8, v9, v11);
  swift_release();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_100007750()
{
  os_log_type_t v1 = sub_10002C5F0();
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v2 = sub_10002C0B0();
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v5;
    sub_10002C650();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v1, "Failed to construct MLComputePlan: %@", v3, 0xCu);
    sub_100008BE0(&qword_10003CA40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = *(void *)(v0 + 80);

  uint64_t v7 = v6 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32);
  uint64_t v9 = *(void *)(v6 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40);
  *(_OWORD *)(v7 + 32) = xmmword_10002D3E0;
  unsigned __int8 v10 = *(unsigned char *)(v7 + 48);
  *(unsigned char *)(v7 + 48) = 3;
  sub_1000088C0(v8, v9, v10);
  swift_errorRelease();
  unsigned __int8 v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_100007930(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = 0;
  if ([a1 predictionFromFeatures:a2 usingState:a3 error:&v6])
  {
    id v3 = v6;
    return swift_unknownObjectRelease();
  }
  else
  {
    id v5 = v6;
    sub_10002BF90();

    return swift_willThrow();
  }
}

uint64_t sub_1000079F0(void *a1, uint64_t a2)
{
  id v5 = 0;
  if ([a1 predictionFromFeatures:a2 error:&v5])
  {
    id v2 = v5;
    return swift_unknownObjectRelease();
  }
  else
  {
    id v4 = v5;
    sub_10002BF90();

    return swift_willThrow();
  }
}

void sub_100007AAC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = v3;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v46 = a1;
  if (a1 < 1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  double v9 = Current;
  uint64_t v10 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  double v11 = (double)a2;
  uint64_t v12 = 1;
  int v44 = 134218240;
  uint64_t v45 = v5;
  uint64_t v47 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  while (1)
  {
    uint64_t v14 = *(void *)(v5 + v10);
    swift_retain();
    *(CFAbsoluteTime *)(v14 + 16) = CFAbsoluteTimeGetCurrent();
    *(unsigned char *)(v14 + 24) = 0;
    uint64_t v15 = swift_release();
    a3(v15);
    if (v4)
    {
      return;
    }
    uint64_t v16 = *(void *)(v5 + v10);
    if ((*(unsigned char *)(v16 + 24) & 1) == 0)
    {
      uint64_t v17 = a2;
      double v18 = *(double *)(v16 + 16);
      swift_retain();
      double v19 = CFAbsoluteTimeGetCurrent();
      unint64_t v20 = (char **)(v16 + 32);
      swift_beginAccess();
      uint64_t v21 = *(char **)(v16 + 32);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v16 + 32) = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v21 = sub_100009988(0, *((void *)v21 + 2) + 1, 1, v21);
        NSObject *v20 = v21;
      }
      unint64_t v24 = *((void *)v21 + 2);
      unint64_t v23 = *((void *)v21 + 3);
      if (v24 >= v23 >> 1)
      {
        uint64_t v21 = sub_100009988((char *)(v23 > 1), v24 + 1, 1, v21);
        NSObject *v20 = v21;
      }
      a2 = v17;
      *((void *)v21 + 2) = v24 + 1;
      *(double *)&v21[8 * v24 + 32] = v19 - v18;
      swift_endAccess();
      swift_release();
      uint64_t v5 = v45;
      uint64_t v10 = v47;
    }
    double v25 = CFAbsoluteTimeGetCurrent();
    if (!a2)
    {
      if (qword_10003C918 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_10002C0D0();
      sub_10000A920(v36, (uint64_t)qword_10003C920);
      v28 = sub_10002C0B0();
      os_log_type_t v37 = sub_10002C5F0();
      if (!os_log_type_enabled(v28, v37)) {
        goto LABEL_21;
      }
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      id v31 = v28;
      os_log_type_t v32 = v37;
      v33 = "Max prediction time ignored";
      v34 = v38;
      uint32_t v35 = 2;
      goto LABEL_20;
    }
    double v26 = v25 - v9;
    if (v25 - v9 >= v11) {
      break;
    }
    if (qword_10003C918 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_10002C0D0();
    sub_10000A920(v27, (uint64_t)qword_10003C920);
    v28 = sub_10002C0B0();
    os_log_type_t v29 = sub_10002C5F0();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_21;
    }
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 134218240;
    *(double *)(v30 + 4) = v26;
    *(_WORD *)(v30 + 12) = 2048;
    *(void *)(v30 + 14) = a2;
    id v31 = v28;
    os_log_type_t v32 = v29;
    v33 = "Max prediction time not yet exceeded: %f < %lld";
    v34 = (uint8_t *)v30;
    uint32_t v35 = 22;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v31, v32, v33, v34, v35);
    swift_slowDealloc();
    uint64_t v10 = v47;
LABEL_21:

    if (v46 == v12) {
      return;
    }
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
  }
  if (qword_10003C918 != -1) {
LABEL_32:
  }
    swift_once();
  uint64_t v40 = sub_10002C0D0();
  sub_10000A920(v40, (uint64_t)qword_10003C920);
  v41 = sub_10002C0B0();
  os_log_type_t v42 = sub_10002C5E0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = v44;
    sub_10002C650();
    *(_WORD *)(v43 + 12) = 2048;
    sub_10002C650();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Max prediction time exceeded: %f >= %lld", (uint8_t *)v43, 0x16u);
    swift_slowDealloc();
  }
}

void sub_100007F14()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(char *)(v1 + v3 + 32);
      sub_10002C5E0();
      if (qword_10003C908 != -1) {
        swift_once();
      }
      ++v3;
      sub_100008BE0(&qword_10003CA28);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_10002D3D0;
      uint64_t v6 = 8 * v4;
      uint64_t v7 = qword_10002DB48[v4];
      uint64_t v8 = *(void *)((char *)&unk_10002DB68 + v6);
      *(void *)(v5 + 56) = &type metadata for String;
      *(void *)(v5 + 64) = sub_10000A8CC();
      *(void *)(v5 + 32) = v7;
      *(void *)(v5 + 40) = v8;
      sub_10002C0A0();
      swift_bridgeObjectRelease();
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
}

char *sub_1000080A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = sub_10002C030();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000084A4();
  if (!v5)
  {
    uint64_t v40 = a4;
    swift_unknownObjectWeakInit();
    uint64_t v39 = a3;
    if (a3 < 1) {
      goto LABEL_21;
    }
    v35[0] = a1;
    v35[1] = 0;
    uint64_t v36 = v10;
    uint64_t v37 = v9;
    id v41 = self;
    uint64_t v13 = &v4[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers];
    uint64_t v14 = 1;
    swift_beginAccess();
    v38 = v12;
    uint64_t v16 = v39;
    uint64_t v15 = v40;
    while (1)
    {
      uint64_t v19 = *((void *)v13 + 2);
      swift_retain();
      *(CFAbsoluteTime *)(v19 + 16) = CFAbsoluteTimeGetCurrent();
      *(unsigned char *)(v19 + 24) = 0;
      swift_release();
      id v20 = v15;
      sub_10002BFF0(v21);
      unint64_t v23 = v22;
      v42[0] = 0;
      uint64_t v4 = (char *)[v41 modelWithContentsOfURL:v22 configuration:v20 error:v42];

      if (!v4) {
        break;
      }
      id v24 = v42[0];

      uint64_t v25 = *((void *)v13 + 2);
      if ((*(unsigned char *)(v25 + 24) & 1) == 0)
      {
        double v26 = *(double *)(v25 + 16);
        swift_retain();
        double Current = CFAbsoluteTimeGetCurrent();
        v28 = (char **)(v25 + 32);
        swift_beginAccess();
        os_log_type_t v29 = *(char **)(v25 + 32);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v25 + 32) = v29;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          os_log_type_t v29 = sub_100009988(0, *((void *)v29 + 2) + 1, 1, v29);
          NSObject *v28 = v29;
        }
        unint64_t v32 = *((void *)v29 + 2);
        unint64_t v31 = *((void *)v29 + 3);
        if (v32 >= v31 >> 1)
        {
          os_log_type_t v29 = sub_100009988((char *)(v31 > 1), v32 + 1, 1, v29);
          NSObject *v28 = v29;
        }
        uint64_t v15 = v40;
        *((void *)v29 + 2) = v32 + 1;
        *(double *)&v29[8 * v32 + 32] = Current - v26;
        swift_endAccess();
        swift_release();
        uint64_t v12 = v38;
        uint64_t v16 = v39;
      }
      swift_unknownObjectWeakAssign();
      if (v16 == v14)
      {
        (*(void (**)(void, char *, uint64_t))(v36 + 32))(v35[0], v12, v37);
        swift_unknownObjectWeakDestroy();
        return v4;
      }

      Strong = (void *)swift_unknownObjectWeakLoadStrong();

      if (Strong)
      {
        sub_10002C600();
        if (qword_10003C908 != -1) {
          swift_once();
        }
        sub_10002C0A0();
      }
      if (__OFADD__(v14++, 1))
      {
        __break(1u);
LABEL_21:
        __break(1u);
      }
    }
    uint64_t v4 = (char *)v42[0];
    sub_10002BF90();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
    swift_unknownObjectWeakDestroy();
  }
  return v4;
}

void sub_1000084A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 8);
  swift_retain();
  *(CFAbsoluteTime *)(v2 + 16) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(v2 + 24) = 0;
  swift_release();
  uint64_t v3 = self;
  sub_10002BFF0(v4);
  uint64_t v6 = v5;
  v20[0] = 0;
  id v7 = [v3 compileModelAtURL:v5 error:v20];

  id v8 = v20[0];
  if (v7)
  {
    sub_10002C010();
    id v9 = v8;

    uint64_t v10 = *(void *)(v1 + 8);
    if ((*(unsigned char *)(v10 + 24) & 1) == 0)
    {
      double v11 = *(double *)(v10 + 16);
      swift_retain();
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = (char **)(v10 + 32);
      swift_beginAccess();
      uint64_t v14 = *(char **)(v10 + 32);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v10 + 32) = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v14 = sub_100009988(0, *((void *)v14 + 2) + 1, 1, v14);
        char *v13 = v14;
      }
      double v16 = Current - v11;
      unint64_t v18 = *((void *)v14 + 2);
      unint64_t v17 = *((void *)v14 + 3);
      if (v18 >= v17 >> 1)
      {
        uint64_t v14 = sub_100009988((char *)(v17 > 1), v18 + 1, 1, v14);
        char *v13 = v14;
      }
      *((void *)v14 + 2) = v18 + 1;
      *(double *)&v14[8 * v18 + 32] = v16;
      swift_endAccess();
      swift_release();
    }
  }
  else
  {
    id v19 = v20[0];
    sub_10002BF90();

    swift_willThrow();
  }
}

id sub_1000086C4()
{
  return sub_1000086DC(type metadata accessor for PerfRunner);
}

id sub_1000086DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for PerfRunner()
{
  return self;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_100008804(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

void destroy for PerfRunner.TimerResults(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000088C0(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t sub_1000088C0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100008804(v6, v7, v8);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  id v9 = *(void **)(a2 + 56);
  *(void *)(a1 + 56) = v9;
  id v10 = v9;
  return a1;
}

uint64_t assignWithCopy for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 48);
  sub_100008804(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v6;
  sub_1000088C0(v7, v8, v9);
  id v10 = *(void **)(a2 + 56);
  double v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  id v12 = v10;

  return a1;
}

__n128 initializeWithTake for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  char v4 = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v4;
  sub_1000088C0(v5, v6, v7);
  uint64_t v8 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  return a1;
}

uint64_t getEnumTagSinglePayload for PerfRunner.TimerResults(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PerfRunner.TimerResults(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.TimerResults()
{
  return &type metadata for PerfRunner.TimerResults;
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

uint64_t sub_100008BE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100008C24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008C68()
{
  unint64_t result = qword_10003C9E0;
  if (!qword_10003C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9E0);
  }
  return result;
}

unint64_t sub_100008CBC()
{
  unint64_t result = qword_10003C9F8;
  if (!qword_10003C9F8)
  {
    sub_100008D30(&qword_10003C9F0);
    sub_100008D78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9F8);
  }
  return result;
}

uint64_t sub_100008D30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008D78()
{
  unint64_t result = qword_10003CA00;
  if (!qword_10003CA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA00);
  }
  return result;
}

uint64_t sub_100008DCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100008E28()
{
  unint64_t result = qword_10003CA08;
  if (!qword_10003CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA08);
  }
  return result;
}

uint64_t sub_100008E7C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008EC4()
{
  return sub_10002C090();
}

uint64_t sub_100008F10()
{
  return sub_10002C080();
}

Swift::Int sub_100008F68()
{
  return sub_10002C990();
}

uint64_t sub_100008FD0(uint64_t a1, uint64_t a2)
{
  return sub_10000913C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100008FE8(uint64_t a1, id *a2)
{
  uint64_t result = sub_10002C460();
  *a2 = 0;
  return result;
}

uint64_t sub_100009060(uint64_t a1, id *a2)
{
  char v3 = sub_10002C470();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000090E0@<X0>(void *a1@<X8>)
{
  sub_10002C480();
  NSString v2 = sub_10002C450();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100009124(uint64_t a1, uint64_t a2)
{
  return sub_10000913C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000913C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10002C480();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100009180()
{
  sub_10002C480();
  sub_10002C4E0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000091D4()
{
  sub_10002C480();
  sub_10002C970();
  sub_10002C4E0();
  Swift::Int v0 = sub_10002C990();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009248()
{
  swift_getWitnessTable();
  return sub_10002C070();
}

uint64_t sub_1000092B4()
{
  uint64_t v0 = sub_10002C480();
  uint64_t v2 = v1;
  if (v0 == sub_10002C480() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10002C900();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100009340@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10002C450();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100009388@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002C480();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000093B4(uint64_t a1)
{
  uint64_t v2 = sub_100008E7C(&qword_10003CBD0, 255, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_100008E7C(&qword_10003CBD8, 255, type metadata accessor for URLResourceKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100009478(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000E4E0;
  return v6();
}

uint64_t sub_100009544(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *char v5 = v4;
  v5[1] = sub_10000E4E0;
  return v7();
}

uint64_t sub_100009610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002C5A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002C590();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D700(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002C580();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000097B4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100009890;
  return v6(a1);
}

uint64_t sub_100009890()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_100009988(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008BE0(&qword_10003CA20);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000A7DC(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100009A98(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008BE0(&qword_10003CAD8);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000D140(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100009BA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008BE0(&qword_10003CAE0);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000D140(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100009CB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008BE0(&qword_10003CAF0);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000A7DC(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100009DC8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008BE0(&qword_10003CAE8);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000D22C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100009ED8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000100030AF0 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E756F4364616F6CLL && a2 == 0xE900000000000074 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6974636964657270 && a2 == 0xEF746E756F436E6FLL || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100030B20 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100030B40 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6F6974636E7566 && a2 == 0xEC000000656D614ELL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_10000A164(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646F43726F727265 && a2 == 0xE900000000000065;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10000A268@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (objc_class *)type metadata accessor for PerfRunConfig();
  char v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations] = 0;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount] = 0;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount] = 0;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime] = 0;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime] = 0;
  char v6 = &v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName];
  *(void *)char v6 = 0;
  *((void *)v6 + 1) = 0;
  v15.receiver = v5;
  v15.super_class = v4;
  id v7 = [super init];
  uint64_t v8 = a1;

  uint64_t v9 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount];
  type metadata accessor for SampleTimer();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(unsigned char *)(v10 + 24) = 1;
  *(void *)(v10 + 32) = &_swiftEmptyArrayStorage;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(unsigned char *)(v12 + 24) = 1;
  *(void *)(v12 + 32) = &_swiftEmptyArrayStorage;
  *(void *)(v12 + 40) = v11;
  uint64_t v13 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount];
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(unsigned char *)(result + 24) = 1;
  *(void *)(result + 32) = &_swiftEmptyArrayStorage;
  *(void *)(result + 40) = v13;
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = result;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 3;
  *(void *)(a2 + 56) = v8;
  return result;
}

uint64_t sub_10000A3D0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74636964657270 && a2 == 0xE700000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C69706D6F63 && a2 == 0xE700000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1684107116 && a2 == 0xE400000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001000310D0 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7274536C65646F6DLL && a2 == 0xEE00657275746375 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x436E755266726570 && a2 == 0xED00006769666E6FLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_10000A64C(uint64_t a1)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x8000000100030F60;
  switch(a1)
  {
    case 0:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v2 = 0x796C6E4F7570632ELL;
      break;
    case 1:
      unint64_t v3 = 0xEA00000000005550;
      unint64_t v2 = 0x47646E417570632ELL;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v2 = 1819042094;
      break;
    case 3:
      break;
    default:
      unint64_t v2 = 0xD000000000000015;
      unint64_t v3 = 0x8000000100030F10;
      break;
  }
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  sub_100008BE0(&qword_10003CA28);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10002D3D0;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_10000A8CC();
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v3;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_10000A7DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    id v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_10002C7A0();
  __break(1u);
  return result;
}

unint64_t sub_10000A8CC()
{
  unint64_t result = qword_10003CA30;
  if (!qword_10003CA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA30);
  }
  return result;
}

uint64_t sub_10000A920(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000A958(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_10000A9BC()
{
  if (sub_10001D4B4())
  {
    if (qword_10003C918 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_10002C0D0();
    sub_10000A920(v0, (uint64_t)qword_10003C920);
    os_log_type_t v1 = sub_10002C5F0();
    unint64_t v2 = sub_10002C0B0();
    if (os_log_type_enabled(v2, v1))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v1, "About to purge ANE binary for compiled model", v3, 2u);
      swift_slowDealloc();
    }

    uint64_t v4 = self;
    sub_10002BFF0(v5);
    id v7 = v6;
    id v34 = 0;
    LODWORD(v4) = [v4 purgeANEBinaryForModelAtURL:v6 error:&v34];

    id v8 = v34;
    if (!v4) {
      goto LABEL_20;
    }
    id v9 = v34;
    os_log_type_t v10 = sub_10002C5F0();
    uint64_t v11 = sub_10002C0B0();
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v10, "Successfully purged ANE binary for compiled model", v12, 2u);
      swift_slowDealloc();
    }

    os_log_type_t v13 = sub_10002C5F0();
    uint64_t v14 = sub_10002C0B0();
    if (os_log_type_enabled(v14, v13))
    {
      objc_super v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "About to purge compiled model", v15, 2u);
      swift_slowDealloc();
    }

    id v16 = [self defaultManager];
    sub_10002BFF0(v17);
    id v19 = v18;
    id v34 = 0;
    unsigned int v20 = [v16 removeItemAtURL:v18 error:&v34];

    id v8 = v34;
    if (v20)
    {
      id v21 = v34;
      os_log_type_t v22 = sub_10002C5F0();
      unint64_t v23 = sub_10002C0B0();
      if (os_log_type_enabled(v23, v22))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v22, "Successfully purged compiled model", v24, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
LABEL_20:
      id v29 = v8;
      sub_10002BF90();

      swift_willThrow();
      sub_10002C600();
      if (qword_10003C908 != -1) {
        swift_once();
      }
      sub_100008BE0(&qword_10003CA28);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_10002D3D0;
      uint64_t v31 = sub_10002C020();
      uint64_t v33 = v32;
      *(void *)(v30 + 56) = &type metadata for String;
      *(void *)(v30 + 64) = sub_10000A8CC();
      *(void *)(v30 + 32) = v31;
      *(void *)(v30 + 40) = v33;
      sub_10002C0A0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
    }
  }
  else
  {
    sub_10002C600();
    if (qword_10003C908 != -1) {
      swift_once();
    }
    sub_100008BE0(&qword_10003CA28);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_10002D3D0;
    uint64_t v26 = sub_10002C020();
    uint64_t v28 = v27;
    *(void *)(v25 + 56) = &type metadata for String;
    *(void *)(v25 + 64) = sub_10000A8CC();
    *(void *)(v25 + 32) = v26;
    *(void *)(v25 + 40) = v28;
    sub_10002C0A0();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  uint64_t v6 = sub_10002C030();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000AF94, 0, 0);
}

uint64_t sub_10000AF94()
{
  void (*v61)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t (*v69)();
  void (*v70)(uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  double v79;
  id v80;
  NSObject *v81;
  os_log_type_t v82;
  BOOL v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  const char *v88;
  uint8_t *v89;
  uint32_t v90;
  os_log_type_t v91;
  uint8_t *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  long long *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t (*v108)();
  os_log_type_t v109;
  BOOL v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  long long v115;
  long long v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v118 = v0;
  if (qword_10003C918 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10002C0D0();
  *(void *)(v0 + 120) = sub_10000A920(v1, (uint64_t)qword_10003C920);
  os_log_type_t v2 = sub_10002C5F0();
  uint64_t v3 = sub_10002C0B0();
  if (os_log_type_enabled(v3, v2))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "beginning first security check on model URL", v4, 2u);
    swift_slowDealloc();
  }

  if ((sub_10001D4B4() & 1) == 0)
  {
    os_log_type_t v23 = sub_10002C600();
    id v24 = sub_10002C0B0();
    if (!os_log_type_enabled(v24, v23)) {
      goto LABEL_21;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    uint64_t v26 = "failed first security check on model URL";
    goto LABEL_20;
  }
  os_log_type_t v5 = sub_10002C5F0();
  uint64_t v6 = sub_10002C0B0();
  if (os_log_type_enabled(v6, v5))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "beginning second security check on model URL", v7, 2u);
    swift_slowDealloc();
  }

  if ((sub_10001D900() & 1) == 0)
  {
    os_log_type_t v23 = sub_10002C600();
    id v24 = sub_10002C0B0();
    if (!os_log_type_enabled(v24, v23)) {
      goto LABEL_21;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    uint64_t v26 = "failed second security check on model URL";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v24, v23, v26, v25, 2u);
    swift_slowDealloc();
LABEL_21:

    sub_10000CFEC();
    swift_allocError();
    unsigned char *v27 = 1;
    swift_willThrow();
LABEL_22:
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_23;
  }
  os_log_type_t v8 = sub_10002C5F0();
  id v9 = sub_10002C0B0();
  if (os_log_type_enabled(v9, v8))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "passed security checks on model URL", v10, 2u);
    swift_slowDealloc();
  }
  uint64_t v11 = (uint64_t *)(v0 + 16);

  os_log_type_t v12 = sub_10002C5F0();
  os_log_type_t v13 = sub_10002C0B0();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v12, "initializing random seed", v14, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for SeededRNG();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *uint64_t v11 = v15;
  os_log_type_t v16 = sub_10002C5F0();
  unint64_t v17 = sub_10002C0B0();
  if (os_log_type_enabled(v17, v16))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v16, "trying inputGenerator", v18, 2u);
    swift_slowDealloc();
  }
  uint64_t v19 = *(void *)(v0 + 64);

  unsigned int v20 = (void *)sub_100016F40((uint64_t)_swiftEmptyArrayStorage);
  sub_100016390(v19, v20);
  *(void *)(v0 + 128) = v21;
  *(void *)(v0 + 136) = v22;
  swift_bridgeObjectRelease();
  os_log_type_t v30 = sub_10002C5F0();
  uint64_t v31 = sub_10002C0B0();
  if (os_log_type_enabled(v31, v30))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v30, "finished inputGenerator", v32, 2u);
    swift_slowDealloc();
  }
  uint64_t v34 = *(void *)(v0 + 72);
  uint64_t v33 = *(void *)(v0 + 80);

  uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName + 8);
  id v36 = [objc_allocWithZone((Class)MLModelConfiguration) init];
  *(void *)(v0 + 144) = v36;
  [v36 setComputeUnits:v34];
  if (v35) {
    NSString v37 = sub_10002C450();
  }
  else {
    NSString v37 = 0;
  }
  uint64_t v38 = *(void *)(v0 + 80);
  [v36 setFunctionName:v37];

  uint64_t v42 = *(void *)(v38 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations);
  *(void *)(v0 + 152) = v42;
  if (v42 < 0)
  {
    __break(1u);
    return _swift_task_switch(v39, v40, v41);
  }
  if (!v42)
  {
LABEL_54:
    v99 = *(void **)(v0 + 144);
    v100 = *(void *)(v0 + 88);
    v101 = *(void *)(v0 + 56);
    v102 = sub_100010414();
    v103 = (long long *)(v100 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
    *(void *)(v100 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v102;
    swift_bridgeObjectRelease();
    sub_100007F14();

    swift_release();
    swift_release();
    v105 = *((void *)v103 + 4);
    v104 = *((void *)v103 + 5);
    LOBYTE(v99) = *((unsigned char *)v103 + 48);
    v106 = *((void *)v103 + 7);
    v115 = v103[1];
    v116 = *v103;
    swift_task_dealloc();
    *(_OWORD *)v101 = v116;
    *(_OWORD *)(v101 + 16) = v115;
    *(void *)(v101 + 32) = v105;
    *(void *)(v101 + 40) = v104;
    *(unsigned char *)(v101 + 48) = (_BYTE)v99;
    *(void *)(v101 + 56) = v106;
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
LABEL_23:
    return v28();
  }
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = *(void *)(v0 + 80);
  uint64_t v46 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount;
  uint64_t v47 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime;
  *(void *)(v0 + 160) = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount;
  *(void *)(v0 + 168) = v47;
  *(void *)(v0 + 176) = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime;
  *(void *)(v0 + 184) = *(void *)(v45 + v46);
  *(void *)(v0 + 192) = 0;
  while (1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    os_log_type_t v49 = sub_10002C5F0();
    uint64_t v50 = sub_10002C0B0();
    if (os_log_type_enabled(v50, v49))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v49, "Invoking compileAndLoadModel", v51, 2u);
      swift_slowDealloc();
    }
    uint64_t v52 = *(void *)(v0 + 184);
    uint64_t v53 = *(void **)(v0 + 144);
    uint64_t v54 = *(void *)(v0 + 112);
    uint64_t v55 = *(void *)(v0 + 64);

    uint64_t v56 = sub_1000080A4(v54, v55, v52, v53);
    *(void *)(v0 + 200) = v56;
    if (v44)
    {

      swift_release();
      swift_release();
      goto LABEL_22;
    }
    uint64_t v57 = v56;
    uint64_t v58 = sub_10002C5F0();
    uint64_t v59 = sub_10002C0B0();
    if (os_log_type_enabled(v59, (os_log_type_t)v58))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, (os_log_type_t)v58, "Finished compileAndLoadModel", v60, 2u);
      swift_slowDealloc();
    }
    uint64_t v61 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v0 + 128);

    v61(&v117, v11);
    uint64_t v62 = v117;
    *(void *)(v0 + 208) = v117;
    uint64_t v63 = [v57 modelDescription];
    uint64_t v64 = [v63 stateDescriptionsByName];

    sub_10000D040(0, &qword_10003CA70);
    uint64_t v65 = sub_10002C440();

    uint64_t v66 = *(void *)(v65 + 16);
    swift_bridgeObjectRelease();
    if (v66)
    {
      uint64_t v67 = sub_10002C620();
      v68 = (void *)swift_allocObject();
      v68[2] = v57;
      v68[3] = v62;
      v68[4] = v67;
      int64_t v69 = sub_10000D0C4;
    }
    else
    {
      v68 = (void *)swift_allocObject();
      v68[2] = v57;
      v68[3] = v62;
      int64_t v69 = sub_10000D124;
    }
    v70 = (void (*)(uint64_t))v69;
    *(void *)(v0 + 216) = v68;
    pid_t v71 = *(void *)(v0 + 80);
    v72 = *(void *)(v71 + *(void *)(v0 + 160));
    id v73 = *(void *)(v71 + *(void *)(v0 + 168));
    int64_t v74 = v57;
    swift_unknownObjectRetain();
    swift_retain();
    sub_100007AAC(v72, v73, v70);
    *(void *)(v0 + 224) = 0;
    int64_t v75 = *(void *)(v0 + 176);
    int64_t v76 = *(void *)(v0 + 80);
    swift_release();
    int64_t v77 = CFAbsoluteTimeGetCurrent();
    v78 = *(void *)(v76 + v75);
    if (!v78)
    {
      v81 = sub_10002C0B0();
      v91 = sub_10002C5F0();
      if (!os_log_type_enabled(v81, v91)) {
        goto LABEL_50;
      }
      v92 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v92 = 0;
      v86 = v81;
      v87 = v91;
      v88 = "Max iteration time ignored";
      v89 = v92;
      v90 = 2;
      goto LABEL_48;
    }
    v79 = v77 - Current;
    v80 = *(id *)(v0 + 80);
    v81 = sub_10002C0B0();
    if (v79 >= (double)v78) {
      break;
    }
    id v82 = sub_10002C5F0();
    v83 = os_log_type_enabled(v81, v82);
    pid_t v84 = *(void **)(v0 + 80);
    if (v83)
    {
      v85 = swift_slowAlloc();
      *(_DWORD *)v85 = 134218240;
      *(double *)(v0 + 24) = v79;
      sub_10002C650();
      *(_WORD *)(v85 + 12) = 2048;
      *(void *)(v0 + 32) = v78;
      sub_10002C650();

      v86 = v81;
      v87 = v82;
      v88 = "Max iteration time not yet exceeded: %f < %lld";
      v89 = (uint8_t *)v85;
      v90 = 22;
LABEL_48:
      _os_log_impl((void *)&_mh_execute_header, v86, v87, v88, v89, v90);
      swift_slowDealloc();
      goto LABEL_50;
    }

LABEL_50:
    if (v43 == *(void *)(v0 + 152) - 1)
    {
      v107 = (void *)swift_task_alloc();
      *(void *)(v0 + 240) = v107;
      *v107 = v0;
      v108 = sub_10000BEA4;
      goto LABEL_61;
    }
    swift_unknownObjectRelease();
    swift_release();
    v93 = *(void **)(v0 + 200);
    v94 = *(void *)(v0 + 152);
    v96 = *(void *)(v0 + 104);
    v95 = *(void *)(v0 + 112);
    v97 = *(void *)(v0 + 96);
    v98 = *(void *)(v0 + 192) + 1;
    sub_10000A9BC();

    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
    if (v98 == v94) {
      goto LABEL_54;
    }
    uint64_t v44 = *(void *)(v0 + 224);
    uint64_t v43 = *(void *)(v0 + 192) + 1;
    *(void *)(v0 + 192) = v43;
    if (v43 == *(void *)(v0 + 152))
    {
      __break(1u);
      goto LABEL_54;
    }
  }
  v109 = sub_10002C5E0();
  v110 = os_log_type_enabled(v81, v109);
  v111 = *(void **)(v0 + 80);
  if (v110)
  {
    v112 = swift_slowAlloc();
    *(_DWORD *)v112 = 134218240;
    *(double *)(v0 + 40) = v79;
    sub_10002C650();
    *(_WORD *)(v112 + 12) = 2048;
    *(void *)(v0 + 48) = v78;
    sub_10002C650();

    _os_log_impl((void *)&_mh_execute_header, v81, v109, "Max iteration time exceeded: %f >= %lld", (uint8_t *)v112, 0x16u);
    swift_slowDealloc();
  }
  else
  {
  }
  v107 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v107;
  *v107 = v0;
  v108 = sub_10000BC74;
LABEL_61:
  v107[1] = v108;
  v113 = *(void *)(v0 + 112);
  v114 = *(void *)(v0 + 88);
  v107[9] = *(void *)(v0 + 144);
  v107[10] = v114;
  v107[8] = v113;
  uint64_t v39 = sub_100007334;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  return _swift_task_switch(v39, v40, v41);
}

uint64_t sub_10000BC74()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000BD70, 0, 0);
}

uint64_t sub_10000BD70()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v3 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[12];
  swift_release();
  swift_unknownObjectRelease();
  sub_10000A9BC();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  os_log_type_t v5 = (void *)v0[18];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[7];
  os_log_type_t v8 = sub_100010414();
  id v9 = (long long *)(v6 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  *(void *)(v6 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v8;
  swift_bridgeObjectRelease();
  sub_100007F14();
  swift_release();

  swift_release();
  uint64_t v11 = *((void *)v9 + 4);
  uint64_t v10 = *((void *)v9 + 5);
  LOBYTE(v5) = *((unsigned char *)v9 + 48);
  uint64_t v12 = *((void *)v9 + 7);
  long long v15 = v9[1];
  long long v16 = *v9;
  swift_task_dealloc();
  *(_OWORD *)uint64_t v7 = v16;
  *(_OWORD *)(v7 + 16) = v15;
  *(void *)(v7 + 32) = v11;
  *(void *)(v7 + 40) = v10;
  *(unsigned char *)(v7 + 48) = (_BYTE)v5;
  *(void *)(v7 + 56) = v12;
  os_log_type_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10000BEA4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000BFA0, 0, 0);
}

uint64_t sub_10000BFA0()
{
  void (*v25)(uint64_t *__return_ptr, uint64_t);
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t (*v33)();
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  BOOL v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  const char *v52;
  uint8_t *v53;
  uint32_t v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  long long *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(void);
  void *v67;
  uint64_t (*v68)();
  os_log_type_t v69;
  BOOL v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  long long v75;
  long long v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v78 = v0;
  swift_unknownObjectRelease();
  swift_release();
  while (1)
  {
    uint64_t v1 = *(void **)(v0 + 200);
    uint64_t v2 = *(void *)(v0 + 152);
    uint64_t v4 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 192) + 1;
    sub_10000A9BC();

    uint64_t v7 = (uint64_t (*)())(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    if (v6 == v2) {
      break;
    }
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 192);
    *(void *)(v0 + 192) = v11 + 1;
    if (v11 + 1 == *(void *)(v0 + 152))
    {
      __break(1u);
      return _swift_task_switch(v7, v8, v9);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    os_log_type_t v13 = sub_10002C5F0();
    uint64_t v14 = sub_10002C0B0();
    if (os_log_type_enabled(v14, v13))
    {
      long long v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "Invoking compileAndLoadModel", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v17 = *(void **)(v0 + 144);
    uint64_t v18 = *(void *)(v0 + 112);
    uint64_t v19 = *(void *)(v0 + 64);

    unsigned int v20 = sub_1000080A4(v18, v19, v16, v17);
    *(void *)(v0 + 200) = v20;
    if (v10)
    {

      swift_release();
      swift_release();
      swift_task_dealloc();
      uint64_t v65 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_24;
    }
    uint64_t v21 = v20;
    uint64_t v22 = sub_10002C5F0();
    os_log_type_t v23 = sub_10002C0B0();
    if (os_log_type_enabled(v23, (os_log_type_t)v22))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v22, "Finished compileAndLoadModel", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v25 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v0 + 128);

    v25(&v77, v0 + 16);
    uint64_t v26 = v77;
    *(void *)(v0 + 208) = v77;
    uint64_t v27 = [v21 modelDescription];
    uint64_t v28 = [v27 stateDescriptionsByName];

    sub_10000D040(0, &qword_10003CA70);
    id v29 = sub_10002C440();

    os_log_type_t v30 = *(void *)(v29 + 16);
    swift_bridgeObjectRelease();
    if (v30)
    {
      uint64_t v31 = sub_10002C620();
      uint64_t v32 = (void *)swift_allocObject();
      v32[2] = v21;
      v32[3] = v26;
      v32[4] = v31;
      uint64_t v33 = sub_10000D0C4;
    }
    else
    {
      uint64_t v32 = (void *)swift_allocObject();
      v32[2] = v21;
      v32[3] = v26;
      uint64_t v33 = sub_10000D124;
    }
    uint64_t v34 = (void (*)(uint64_t))v33;
    *(void *)(v0 + 216) = v32;
    uint64_t v35 = *(void *)(v0 + 80);
    id v36 = *(void *)(v35 + *(void *)(v0 + 160));
    NSString v37 = *(void *)(v35 + *(void *)(v0 + 168));
    uint64_t v38 = v21;
    swift_unknownObjectRetain();
    swift_retain();
    sub_100007AAC(v36, v37, v34);
    *(void *)(v0 + 224) = 0;
    uint64_t v39 = *(void *)(v0 + 176);
    uint64_t v40 = *(void *)(v0 + 80);
    swift_release();
    uint64_t v41 = CFAbsoluteTimeGetCurrent();
    uint64_t v42 = *(void *)(v40 + v39);
    if (!v42)
    {
      uint64_t v45 = sub_10002C0B0();
      uint64_t v55 = sub_10002C5F0();
      if (!os_log_type_enabled(v45, v55)) {
        goto LABEL_20;
      }
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v56 = 0;
      uint64_t v50 = v45;
      uint64_t v51 = v55;
      uint64_t v52 = "Max iteration time ignored";
      uint64_t v53 = v56;
      uint64_t v54 = 2;
      goto LABEL_18;
    }
    uint64_t v43 = v41 - Current;
    uint64_t v44 = *(id *)(v0 + 80);
    uint64_t v45 = sub_10002C0B0();
    if (v43 >= (double)v42)
    {
      int64_t v69 = sub_10002C5E0();
      v70 = os_log_type_enabled(v45, v69);
      pid_t v71 = *(void **)(v0 + 80);
      if (v70)
      {
        v72 = swift_slowAlloc();
        *(_DWORD *)v72 = 134218240;
        *(double *)(v0 + 40) = v43;
        sub_10002C650();
        *(_WORD *)(v72 + 12) = 2048;
        *(void *)(v0 + 48) = v42;
        sub_10002C650();

        _os_log_impl((void *)&_mh_execute_header, v45, v69, "Max iteration time exceeded: %f >= %lld", (uint8_t *)v72, 0x16u);
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v67 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v67;
      *uint64_t v67 = v0;
      v68 = sub_10000BC74;
LABEL_32:
      v67[1] = v68;
      id v73 = *(void *)(v0 + 112);
      int64_t v74 = *(void *)(v0 + 88);
      v67[9] = *(void *)(v0 + 144);
      v67[10] = v74;
      v67[8] = v73;
      uint64_t v7 = sub_100007334;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      return _swift_task_switch(v7, v8, v9);
    }
    uint64_t v46 = sub_10002C5F0();
    uint64_t v47 = os_log_type_enabled(v45, v46);
    uint64_t v48 = *(void **)(v0 + 80);
    if (v47)
    {
      os_log_type_t v49 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v49 = 134218240;
      *(double *)(v0 + 24) = v43;
      sub_10002C650();
      *(_WORD *)(v49 + 12) = 2048;
      *(void *)(v0 + 32) = v42;
      sub_10002C650();

      uint64_t v50 = v45;
      uint64_t v51 = v46;
      uint64_t v52 = "Max iteration time not yet exceeded: %f < %lld";
      uint64_t v53 = (uint8_t *)v49;
      uint64_t v54 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v50, v51, v52, v53, v54);
      swift_slowDealloc();
      goto LABEL_20;
    }

LABEL_20:
    if (v11 == *(void *)(v0 + 152) - 2)
    {
      uint64_t v67 = (void *)swift_task_alloc();
      *(void *)(v0 + 240) = v67;
      *uint64_t v67 = v0;
      v68 = sub_10000BEA4;
      goto LABEL_32;
    }
    swift_unknownObjectRelease();
    swift_release();
  }
  uint64_t v57 = *(void **)(v0 + 144);
  uint64_t v58 = *(void *)(v0 + 88);
  uint64_t v59 = *(void *)(v0 + 56);
  v60 = sub_100010414();
  uint64_t v61 = (long long *)(v58 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  *(void *)(v58 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v60;
  swift_bridgeObjectRelease();
  sub_100007F14();

  swift_release();
  swift_release();
  uint64_t v63 = *((void *)v61 + 4);
  uint64_t v62 = *((void *)v61 + 5);
  LOBYTE(v57) = *((unsigned char *)v61 + 48);
  uint64_t v64 = *((void *)v61 + 7);
  int64_t v75 = v61[1];
  int64_t v76 = *v61;
  swift_task_dealloc();
  *(_OWORD *)uint64_t v59 = v76;
  *(_OWORD *)(v59 + 16) = v75;
  *(void *)(v59 + 32) = v63;
  *(void *)(v59 + 40) = v62;
  *(unsigned char *)(v59 + 48) = (_BYTE)v57;
  *(void *)(v59 + 56) = v64;
  uint64_t v65 = *(uint64_t (**)(void))(v0 + 8);
LABEL_24:
  return v65();
}

char *sub_10000C768(_OWORD *a1)
{
  uint64_t v3 = sub_10002C4C0();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002BF50();
  swift_allocObject();
  sub_10002BF40();
  if (qword_10003C918 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10002C0D0();
  sub_10000A920(v6, (uint64_t)qword_10003C920);
  os_log_type_t v7 = sub_10002C5F0();
  uint64_t v8 = sub_10002C0B0();
  if (os_log_type_enabled(v8, v7))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v7, "attempting to encode JSON", v9, 2u);
    swift_slowDealloc();
  }

  long long v10 = a1[1];
  v22[0] = *a1;
  v22[1] = v10;
  long long v11 = a1[3];
  v22[2] = a1[2];
  v22[3] = v11;
  sub_10000CED4();
  uint64_t v12 = sub_10002BF30();
  if (v1)
  {
    swift_release();
  }
  else
  {
    uint64_t v14 = v12;
    unint64_t v15 = v13;
    os_log_type_t v16 = sub_10002C5F0();
    uint64_t v17 = sub_10002C0B0();
    if (os_log_type_enabled(v17, v16))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "successfully encoded JSON", v18, 2u);
      swift_slowDealloc();
    }

    sub_10002C4B0();
    uint64_t v19 = sub_10002C4A0();
    if (v20) {
      uint64_t v5 = (char *)v19;
    }
    else {
      uint64_t v5 = (char *)0xD000000000000011;
    }
    sub_10000CF28(v14, v15);
    swift_release();
  }
  return v5;
}

uint64_t sub_10000C9E4()
{
  sub_10002C600();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  sub_100008BE0(&qword_10003CA28);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002D3D0;
  swift_getErrorValue();
  uint64_t v1 = sub_10002C920();
  uint64_t v3 = v2;
  *(void *)(v0 + 56) = &type metadata for String;
  unint64_t v4 = sub_10000A8CC();
  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  swift_errorRetain();
  sub_100008BE0(&qword_10003CA60);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    sub_10002C600();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10002D3D0;
    unint64_t v7 = sub_100011D6C(v10, v11, v12);
    uint64_t v9 = v8;
    sub_10000CFD4(v10, (uint64_t)v11, v12);
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = v4;
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    sub_10002C0A0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000CBD4()
{
  uint64_t v0 = sub_10002C4C0();
  __chkstk_darwin(v0);
  sub_10002BF50();
  swift_allocObject();
  sub_10002BF40();
  swift_getErrorValue();
  sub_10002C920();
  sub_10000CF80();
  uint64_t v1 = sub_10002BF30();
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  sub_10002C4B0();
  uint64_t v4 = sub_10002C4A0();
  uint64_t v6 = v5;
  sub_10000CF28(v1, v3);
  swift_release();
  if (v6) {
    return v4;
  }
  else {
    return 0xD00000000000001DLL;
  }
}

uint64_t sub_10000CDD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 56);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100008804(v2, v3, v5);
  id v6 = v4;
  return a1;
}

uint64_t sub_10000CE54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 56);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1000088C0(v2, v3, v5);

  return a1;
}

unint64_t sub_10000CED4()
{
  unint64_t result = qword_10003CA50;
  if (!qword_10003CA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA50);
  }
  return result;
}

uint64_t sub_10000CF28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

unint64_t sub_10000CF80()
{
  unint64_t result = qword_10003CA58;
  if (!qword_10003CA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA58);
  }
  return result;
}

uint64_t sub_10000CFD4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000CFEC()
{
  unint64_t result = qword_10003CA68;
  if (!qword_10003CA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA68);
  }
  return result;
}

uint64_t sub_10000D040(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000D07C()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D0C4()
{
  return sub_100007930(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10000D0E4()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D124()
{
  return sub_1000079F0(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

char *sub_10000D140(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unsigned __int8 v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_10000D22C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_10000D320()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000D370()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  unint64_t v5 = (void *)v0[5];
  unint64_t v6 = (void *)v0[6];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *unint64_t v7 = v1;
  v7[1] = sub_10000D438;
  uint64_t v8 = (uint64_t (*)(void *, uint64_t, void *, void *, void *))((char *)&dword_10003CB00 + dword_10003CB00);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10000D438()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D530()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_10000E4E0;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003CB10 + dword_10003CB10);
  return v6(v2, v3, v4);
}

uint64_t sub_10000D5F4()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D634(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_10000E4E0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10003CB20 + dword_10003CB20);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000D700(uint64_t a1)
{
  uint64_t v2 = sub_100008BE0(&qword_10003CAF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D760()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D798(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000D438;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003CB30 + dword_10003CB30);
  return v6(a1, v4);
}

unint64_t sub_10000D850()
{
  unint64_t result = qword_10003CB48;
  if (!qword_10003CB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB48);
  }
  return result;
}

unsigned char *_s13ComputeDeviceV10DeviceTypeOwCP(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunConfig.CodingKeys()
{
  return &type metadata for PerfRunConfig.CodingKeys;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_10000D8F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for PerfRunner.PerfRunError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PerfRunner.PerfRunError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000DA9CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000DAC4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000DACC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.PerfRunError()
{
  return &type metadata for PerfRunner.PerfRunError;
}

uint64_t initializeBufferWithCopyOfBuffer for PerfRunner.ErrorResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PerfRunner.ErrorResponse()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PerfRunner.ErrorResponse(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 _s11DeviceUsageVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PerfRunner.ErrorResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PerfRunner.ErrorResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PerfRunner.ErrorResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.ErrorResponse()
{
  return &type metadata for PerfRunner.ErrorResponse;
}

uint64_t _s14ModelStructureO7ProgramV9OperationV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s35com_apple_dt_DTMLModelRunnerService13PerfRunConfigC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000DDB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.TimerResults.CodingKeys()
{
  return &type metadata for PerfRunner.TimerResults.CodingKeys;
}

unint64_t sub_10000DDF0()
{
  unint64_t result = qword_10003CB60;
  if (!qword_10003CB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB60);
  }
  return result;
}

unint64_t sub_10000DE48()
{
  unint64_t result = qword_10003CB68;
  if (!qword_10003CB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB68);
  }
  return result;
}

uint64_t sub_10000DE9C()
{
  return sub_100008E7C(&qword_10003CB70, 255, type metadata accessor for URLResourceKey);
}

uint64_t sub_10000DEE8()
{
  return sub_100008E7C(&qword_10003CB78, 255, type metadata accessor for URLResourceKey);
}

uint64_t sub_10000DF34()
{
  return sub_100008E7C(&qword_10003CB80, 255, type metadata accessor for URLResourceKey);
}

unint64_t sub_10000DF84()
{
  unint64_t result = qword_10003CB88;
  if (!qword_10003CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB88);
  }
  return result;
}

unint64_t sub_10000DFDC()
{
  unint64_t result = qword_10003CB90;
  if (!qword_10003CB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB90);
  }
  return result;
}

unint64_t sub_10000E034()
{
  unint64_t result = qword_10003CB98;
  if (!qword_10003CB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB98);
  }
  return result;
}

uint64_t sub_10000E088()
{
  return sub_100008E7C((unint64_t *)&qword_10003CBA0, 255, type metadata accessor for CFString);
}

uint64_t sub_10000E0D4()
{
  return sub_100008E7C(&qword_10003CBA8, 255, type metadata accessor for CFString);
}

unint64_t sub_10000E124()
{
  unint64_t result = qword_10003CBB0;
  if (!qword_10003CBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBB0);
  }
  return result;
}

unint64_t sub_10000E17C()
{
  unint64_t result = qword_10003CBB8;
  if (!qword_10003CBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBB8);
  }
  return result;
}

unint64_t sub_10000E1D0()
{
  unint64_t result = qword_10003CBC8;
  if (!qword_10003CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBC8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PerfRunner.ErrorResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PerfRunner.ErrorResponse.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000E380);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10000E3A8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.ErrorResponse.CodingKeys()
{
  return &type metadata for PerfRunner.ErrorResponse.CodingKeys;
}

unint64_t sub_10000E3C8()
{
  unint64_t result = qword_10003CBE0;
  if (!qword_10003CBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBE0);
  }
  return result;
}

unint64_t sub_10000E420()
{
  unint64_t result = qword_10003CBE8;
  if (!qword_10003CBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBE8);
  }
  return result;
}

unint64_t sub_10000E478()
{
  unint64_t result = qword_10003CBF0;
  if (!qword_10003CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBF0);
  }
  return result;
}

uint64_t sub_10000E4E4()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SeededRNG()
{
  return self;
}

unint64_t sub_10000E518()
{
  unint64_t v1 = *(void *)(*(void *)v0 + 16) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)v0 + 16) = v1;
  unint64_t v2 = (0xBF58476D1CE4E5B9 * (v1 ^ (v1 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v1 ^ (v1 >> 30))) >> 27);
  return (0x94D049BB133111EBLL * v2) ^ ((0x94D049BB133111EBLL * v2) >> 31);
}

uint64_t sub_10000E570(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a3 - a2 == -1)
  {
    unint64_t v11 = *(void *)(*a1 + 16) - 0x61C8864680B583EBLL;
    *(void *)(*a1 + 16) = v11;
    unint64_t v12 = (0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27);
    int64_t v10 = (0x94D049BB133111EBLL * v12) ^ ((0x94D049BB133111EBLL * v12) >> 31);
  }
  else
  {
    int64_t v10 = sub_10001398C(a3 - a2 + 1) + a2;
  }
  int64_t v13 = v10 & ~(v10 >> 63);
  swift_bridgeObjectRetain();
  sub_10000E690(0, v13, a2, a3, a4, a5, a1);
  swift_bridgeObjectRelease();
  sub_100008BE0(&qword_10003CCB8);
  sub_10000E900();
  return sub_10002C540();
}

unint64_t sub_10000E690(unint64_t result, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t *a7)
{
  uint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!v7) {
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  int64_t v11 = result;
  unint64_t result = sub_100017964(0, v7 & ~(v7 >> 63), 0);
  if (a2 >= v11 && (v7 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = v7;
    uint64_t v12 = 0;
    uint64_t v13 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v13 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v32 = v13;
    while (v12 != v7)
    {
      if (!v32) {
        goto LABEL_22;
      }
      swift_bridgeObjectRetain();
      unint64_t result = sub_10002C4F0();
      if ((result & 0x8000000000000000) != 0) {
        goto LABEL_23;
      }
      if (!result) {
        goto LABEL_24;
      }
      uint64_t v14 = *a7;
      uint64_t v15 = *(void *)(*a7 + 16);
      uint64_t v16 = v15 - 0x61C8864680B583EBLL;
      *(void *)(*a7 + 16) = v15 - 0x61C8864680B583EBLL;
      unint64_t v17 = 0xBF58476D1CE4E5B9
          * ((v15 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v15 - 0x61C8864680B583EBLL) >> 30));
      unint64_t v18 = (0x94D049BB133111EBLL * (v17 ^ (v17 >> 27))) ^ ((0x94D049BB133111EBLL * (v17 ^ (v17 >> 27))) >> 31);
      unint64_t v19 = v18 * result;
      if (result > v18 * result)
      {
        unint64_t v20 = -(uint64_t)result % result;
        if (v20 > v19)
        {
          unint64_t v21 = v15 + 0x3C6EF372FE94F82ALL;
          do
          {
            v16 -= 0x61C8864680B583EBLL;
            unint64_t v22 = 0x94D049BB133111EBLL
                * ((0xBF58476D1CE4E5B9 * (v21 ^ (v21 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v21 ^ (v21 >> 30))) >> 27));
            v21 -= 0x61C8864680B583EBLL;
          }
          while (v20 > (v22 ^ (v22 >> 31)) * result);
          *(void *)(v14 + 16) = v16;
        }
      }
      sub_10002C500();
      uint64_t v23 = a5;
      uint64_t v24 = sub_10002C530();
      uint64_t v26 = v25;
      unint64_t v27 = a6;
      unint64_t result = swift_bridgeObjectRelease();
      unint64_t v29 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v28 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v29 >= v28 >> 1) {
        unint64_t result = sub_100017964(v28 > 1, v29 + 1, 1);
      }
      ++v12;
      *((void *)&_swiftEmptyArrayStorage + 2) = v29 + 1;
      os_log_type_t v30 = (char *)&_swiftEmptyArrayStorage + 16 * v29;
      *((void *)v30 + 4) = v24;
      *((void *)v30 + 5) = v26;
      uint64_t v7 = v31;
      a6 = v27;
      a5 = v23;
      if (v12 == v31) {
        return (unint64_t)&_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_10000E900()
{
  unint64_t result = qword_10003CCC0[0];
  if (!qword_10003CCC0[0])
  {
    sub_100008D30(&qword_10003CCB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003CCC0);
  }
  return result;
}

uint64_t sub_10000E95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

void *sub_10000E964(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10000E994()
{
  return swift_release();
}

void *sub_10000E99C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 _s14ModelStructureO7ProgramV14NamedValueTypeVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_10000E9E4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s14ModelStructureO8PipelineVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO8PipelineVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AnyValueGenerator()
{
  return sub_10000EAB4();
}

uint64_t sub_10000EAB4()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10000EAE8(uint64_t a1, void (*a2)(void **__return_ptr), char *a3, void (*a4)(uint64_t *__return_ptr, uint64_t), uint64_t inited)
{
  a2(&v28);
  uint64_t v9 = v28;
  unint64_t v10 = v28[2];
  if (v10)
  {
    int64_t v11 = v28 + 4;
    uint64_t v12 = 1;
    uint64_t v13 = v28[2];
    while (1)
    {
      uint64_t v14 = *v11++;
      uint64_t v15 = v12 * v14;
      if ((unsigned __int128)(v12 * (__int128)v14) >> 64 != (v12 * v14) >> 63) {
        break;
      }
      uint64_t v12 = v15;
      if (!--v13) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v15 = 1;
LABEL_7:
  swift_retain();
  a3 = sub_100011EBC(v15, a1, a4);
  swift_release();
  sub_100008BE0(&qword_10003CD60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002D3D0;
  uint64_t v16 = (__CFString *)kCVPixelBufferIOSurfacePropertiesKey;
  *(void *)(inited + 32) = kCVPixelBufferIOSurfacePropertiesKey;
  unint64_t v17 = v16;
  a4 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_100017040((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(inited + 64) = sub_100008BE0(&qword_10003CD68);
  *(void *)(inited + 40) = a4;
  sub_100017184(inited);
  if (!v10) {
    goto LABEL_16;
  }
  if (v10 > v9[2])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  inited = v9[v10 + 3];
  if (!inited)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v15 == 0x8000000000000000 && inited == -1) {
    __break(1u);
  }
  CVPixelBufferRef pixelBufferOut = 0;
  a1 = v15 / inited;
  type metadata accessor for CFString(0);
  sub_10000F908();
  CFDictionaryRef isa = sub_10002C430().super.isa;
  swift_bridgeObjectRelease();
  CVReturn v19 = CVPixelBufferCreate(kCFAllocatorDefault, inited, v15 / inited, 0x4C303068u, isa, &pixelBufferOut);

  if (pixelBufferOut)
  {
    a4 = pixelBufferOut;
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_14:
      unint64_t v20 = *((void *)a3 + 2);
      unint64_t v28 = a3 + 32;
      unint64_t v29 = v20;
      sub_10000EF34((void **)&v28, a1, inited, (CVPixelBufferRef)a4);
      swift_bridgeObjectRelease();
      sub_10000F1E8((uint64_t)v9, (void (*)(uint64_t))&Int._bridgeToObjectiveC());
      swift_bridgeObjectRelease();
      id v21 = objc_allocWithZone((Class)MLMultiArray);
      sub_10000F960();
      Class v22 = sub_10002C550().super.isa;
      swift_bridgeObjectRelease();
      id v23 = [v21 initWithPixelBuffer:a4 shape:v22];

      return (uint64_t)v23;
    }
LABEL_19:
    a3 = sub_10000F298((uint64_t)a3);
    goto LABEL_14;
  }
  os_log_type_t v25 = sub_10002C600();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_10003D878;
  if (os_log_type_enabled((os_log_t)qword_10003D878, v25))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v27 = 67109120;
    LODWORD(v28) = v19;
    sub_10002C650();
    _os_log_impl((void *)&_mh_execute_header, v26, v25, "Failed to create backing PB while generating F16 Multiarray input with err %d", v27, 8u);
    swift_slowDealloc();
  }
  unint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_10002C6B0(77);
  v31._object = (void *)0x80000001000311F0;
  v31._countAndFlagsBits = 0xD00000000000004BLL;
  sub_10002C510(v31);
  v32._countAndFlagsBits = sub_10002C8E0();
  sub_10002C510(v32);
  swift_bridgeObjectRelease();
  uint64_t result = sub_10002C750();
  __break(1u);
  return result;
}

uint64_t sub_10000EF34(void **a1, vImagePixelCount a2, vImagePixelCount a3, CVPixelBufferRef pixelBuffer)
{
  if ((a2 & 0x8000000000000000) != 0 || (a3 & 0x8000000000000000) != 0)
  {
    sub_10002C740();
    __break(1u);
  }
  else
  {
    if ((a3 - 0x2000000000000000) >> 62 != 3) {
      __break(1u);
    }
    src.data = *a1;
    src.height = a2;
    src.width = a3;
    src.rowBytes = 4 * a3;
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    dest.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    dest.height = a2;
    dest.width = a3;
    dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (!vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0)) {
      return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    }
  }
  os_log_type_t v8 = sub_10002C600();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_10003D878;
  if (os_log_type_enabled((os_log_t)qword_10003D878, v8))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 134217984;
    sub_10002C650();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Failed to convert FToF16 for multiarray generation with err %ld", v10, 0xCu);
    swift_slowDealloc();
  }
  sub_10002C6B0(62);
  v13._object = (void *)0x8000000100031290;
  v13._countAndFlagsBits = 0xD00000000000003CLL;
  sub_10002C510(v13);
  v14._countAndFlagsBits = sub_10002C8E0();
  sub_10002C510(v14);
  swift_bridgeObjectRelease();
  uint64_t result = sub_10002C750();
  __break(1u);
  return result;
}

void *sub_10000F1D0(uint64_t a1)
{
  return sub_10000F1E8(a1, (void (*)(uint64_t))&Int64._bridgeToObjectiveC());
}

void *sub_10000F1E8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v3)
  {
    sub_10002C710();
    unsigned int v6 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v6++;
      a2(v7);
      sub_10002C6F0();
      sub_10002C720();
      sub_10002C730();
      sub_10002C700();
      --v3;
    }
    while (v3);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

char *sub_10000F298(uint64_t a1)
{
  return sub_100009A98(0, *(void *)(a1 + 16), 0, (char *)a1);
}

CVPixelBufferRef sub_10000F2AC(size_t a1, size_t a2, OSType a3)
{
  CVPixelBufferRef pixelBufferOut = 0;
  sub_100008BE0(&qword_10003CD60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002D3D0;
  uint64_t v7 = (__CFString *)kCVPixelBufferIOSurfacePropertiesKey;
  *(void *)(inited + 32) = kCVPixelBufferIOSurfacePropertiesKey;
  os_log_type_t v8 = v7;
  unint64_t v9 = sub_100017040((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(inited + 64) = sub_100008BE0(&qword_10003CD68);
  *(void *)(inited + 40) = v9;
  sub_100017184(inited);
  type metadata accessor for CFString(0);
  sub_10000F908();
  CFDictionaryRef isa = sub_10002C430().super.isa;
  swift_bridgeObjectRelease();
  CVPixelBufferCreate(kCFAllocatorDefault, a1, a2, a3, isa, &pixelBufferOut);

  CVPixelBufferRef result = pixelBufferOut;
  if (!pixelBufferOut) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F3F4(__CVBuffer *a1, void (*a2)(uint64_t *__return_ptr, uint64_t), uint64_t a3, uint64_t a4)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = 4;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  int64_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  uint64_t result = (uint64_t)CVPixelBufferGetBaseAddress(a1);
  uint64_t v17 = result;
  if (!result) {
    goto LABEL_29;
  }
  if ((Height & 0x8000000000000000) != 0) {
    goto LABEL_27;
  }
  pixelBuffer = a1;
  if (Height)
  {
    if ((Width & 0x8000000000000000) != 0)
    {
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    uint64_t v11 = 0;
    while (v11 != Height)
    {
      if ((unsigned __int128)(v11 * (__int128)BytesPerRow) >> 64 != (v11 * BytesPerRow) >> 63) {
        goto LABEL_26;
      }
      if (Width)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v17 + v11 * BytesPerRow;
        while (v12 != Width)
        {
          a2(&v19, a4);
          uint64_t result = v19;
          if (v7 > *(void *)(v19 + 16)) {
            goto LABEL_24;
          }
          uint64_t v14 = 0;
          ++v12;
          do
          {
            uint64_t v15 = v14 + 1;
            *(unsigned char *)(v13 + v14) = *(unsigned char *)(result + v14 + 32);
            uint64_t v14 = v15;
          }
          while (v7 != v15);
          uint64_t result = swift_bridgeObjectRelease();
          v13 += v15;
          if (v12 == Width) {
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_24:
        __break(1u);
        break;
      }
LABEL_9:
      if (++v11 == Height) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_20:
  return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

uint64_t sub_10000F584(__CVBuffer *a1, size_t a2, size_t a3)
{
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  VTPixelTransferSessionCreate(kCFAllocatorDefault, &pixelTransferSessionOut);
  if (pixelTransferSessionOut)
  {
    unsigned int v6 = pixelTransferSessionOut;
    unint64_t v7 = sub_10000F2AC(a2, a3, 0x4C303068u);
    OSStatus v8 = VTPixelTransferSessionTransferImage(v6, a1, v7);
    if (v8 == sub_10002C420())
    {
      VTPixelTransferSessionInvalidate(v6);

      return (uint64_t)v7;
    }
    os_log_type_t v13 = sub_10002C600();
    if (qword_10003C908 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_10003D878;
    if (os_log_type_enabled((os_log_t)qword_10003D878, v13))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 67109120;
      sub_10002C650();
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "Failed to convert U8 PB to F16 with err %d", v15, 8u);
      swift_slowDealloc();
    }
    sub_10002C6B0(42);
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = sub_10002C8E0();
    sub_10002C510(v19);
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v10 = sub_10002C600();
    if (qword_10003C908 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_10003D878;
    if (os_log_type_enabled((os_log_t)qword_10003D878, v10))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109120;
      sub_10002C650();
      _os_log_impl((void *)&_mh_execute_header, v11, v10, "Failed to create VTPixelTransferSession with err %d", v12, 8u);
      swift_slowDealloc();
    }
    sub_10002C6B0(51);
    v17._countAndFlagsBits = 0xD000000000000031;
    v17._object = (void *)0x8000000100031180;
    sub_10002C510(v17);
    v18._countAndFlagsBits = sub_10002C8E0();
    sub_10002C510(v18);
    swift_bridgeObjectRelease();
  }
  uint64_t result = sub_10002C750();
  __break(1u);
  return result;
}

unint64_t sub_10000F908()
{
  unint64_t result = qword_10003CBA0;
  if (!qword_10003CBA0)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBA0);
  }
  return result;
}

unint64_t sub_10000F960()
{
  unint64_t result = qword_10003CD70;
  if (!qword_10003CD70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CD70);
  }
  return result;
}

uint64_t sub_10000F9A0(char a1)
{
  return qword_10002E550[a1];
}

uint64_t sub_10000F9C0(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100008BE0(&qword_10003CDD0);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin(v3);
  unint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008BE0(&qword_10003CDD8);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  __chkstk_darwin(v5);
  os_log_type_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008BE0(&qword_10003CDE0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008BE0(&qword_10003CDE8);
  uint64_t v22 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100008BE0(&qword_10003CDF0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100011628();
  sub_10002C9B0();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_100011724();
      sub_10002C840();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_1000116D0();
      Swift::String v17 = v25;
      sub_10002C840();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_10001167C();
      Swift::String v17 = v28;
      sub_10002C840();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_100011778();
      sub_10002C840();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_10000FE08()
{
  return sub_10000F9A0(*v0);
}

uint64_t sub_10000FE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100010904(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000FE38(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000FE44(uint64_t a1)
{
  unint64_t v2 = sub_100011628();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000FE80(uint64_t a1)
{
  unint64_t v2 = sub_100011628();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FEBC()
{
  return 0;
}

uint64_t sub_10000FEC8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_10000FEF8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000FF04(uint64_t a1)
{
  unint64_t v2 = sub_100011778();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000FF40(uint64_t a1)
{
  unint64_t v2 = sub_100011778();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FF7C(uint64_t a1)
{
  unint64_t v2 = sub_100011724();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000FFB8(uint64_t a1)
{
  unint64_t v2 = sub_100011724();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FFF4(uint64_t a1)
{
  unint64_t v2 = sub_1000116D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010030(uint64_t a1)
{
  unint64_t v2 = sub_1000116D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001006C(uint64_t a1)
{
  unint64_t v2 = sub_10001167C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000100A8(uint64_t a1)
{
  unint64_t v2 = sub_10001167C();
  return CodingKey.debugDescription.getter(a1, v2);
}

char *sub_1000100E4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100010A94(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100010110(void *a1)
{
  return sub_10000F9C0(a1, *v1);
}

uint64_t sub_10001012C(void *a1, char a2)
{
  uint64_t v4 = sub_100008BE0(&qword_10003CD88);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100008C24(a1, a1[3]);
  sub_10001085C();
  sub_10002C9B0();
  v9[15] = a2;
  sub_1000108B0();
  sub_10002C8B0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100010270()
{
  return 1;
}

Swift::Int sub_100010278()
{
  return sub_10002C990();
}

void sub_1000102BC()
{
}

Swift::Int sub_1000102E4()
{
  return sub_10002C990();
}

uint64_t sub_100010328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000110CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100010354(uint64_t a1)
{
  unint64_t v2 = sub_10001085C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010390(uint64_t a1)
{
  unint64_t v2 = sub_10001085C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_1000103CC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100011178(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1000103F8(void *a1)
{
  return sub_10001012C(a1, *v1);
}

void *sub_100010414()
{
  uint64_t v0 = sub_10002C210();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (id *)((char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __chkstk_darwin(v2);
  char v34 = (char *)v24 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v24 - v7;
  sub_1000107AC();
  uint64_t v9 = sub_10002C610();
  int64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    char v35 = &_swiftEmptyArrayStorage;
    sub_100017944(0, v10, 0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v11 = v1 + 16;
    unint64_t v13 = (*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64);
    v24[1] = v9;
    unint64_t v14 = v9 + v13;
    uint64_t v31 = *(void *)(v11 + 56);
    char v32 = v12;
    uint64_t v29 = (uint64_t (**)(id *, uint64_t))(v11 + 72);
    uint64_t v30 = (void (**)(id *, char *, uint64_t))(v11 + 16);
    int v28 = enum case for MLComputeDevice.cpu(_:);
    int v26 = enum case for MLComputeDevice.gpu(_:);
    int v25 = enum case for MLComputeDevice.neuralEngine(_:);
    uint64_t v15 = (void (**)(id *, uint64_t))(v11 - 8);
    uint64_t v27 = (void (**)(id *, uint64_t))(v11 + 80);
    uint64_t v33 = v11;
    do
    {
      uint64_t v16 = v32;
      v32(v8, (char *)v14, v0);
      Swift::String v17 = v34;
      v16(v34, v8, v0);
      (*v30)(v4, v17, v0);
      int v18 = (*v29)(v4, v0);
      if (v18 == v28)
      {
        (*v27)(v4, v0);

        char v19 = 0;
      }
      else if (v18 == v26)
      {
        (*v27)(v4, v0);

        char v19 = 1;
      }
      else if (v18 == v25)
      {
        (*v27)(v4, v0);

        char v19 = 2;
      }
      else
      {
        (*v15)(v4, v0);
        char v19 = 3;
      }
      (*v15)((id *)v8, v0);
      unint64_t v20 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100017944(0, v20[2] + 1, 1);
        unint64_t v20 = v35;
      }
      unint64_t v22 = v20[2];
      unint64_t v21 = v20[3];
      if (v22 >= v21 >> 1)
      {
        sub_100017944(v21 > 1, v22 + 1, 1);
        unint64_t v20 = v35;
      }
      v20[2] = v22 + 1;
      *((unsigned char *)v20 + v22 + 32) = v19;
      v14 += v31;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return v20;
}

unint64_t sub_1000107AC()
{
  unint64_t result = qword_10003CD78;
  if (!qword_10003CD78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CD78);
  }
  return result;
}

ValueMetadata *_s13ComputeDeviceVMa()
{
  return &_s13ComputeDeviceVN;
}

unint64_t sub_100010808()
{
  unint64_t result = qword_10003CD80;
  if (!qword_10003CD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CD80);
  }
  return result;
}

unint64_t sub_10001085C()
{
  unint64_t result = qword_10003CD90;
  if (!qword_10003CD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CD90);
  }
  return result;
}

unint64_t sub_1000108B0()
{
  unint64_t result = qword_10003CD98;
  if (!qword_10003CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CD98);
  }
  return result;
}

uint64_t sub_100010904(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7696483 && a2 == 0xE300000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7696487 && a2 == 0xE300000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E456C617275656ELL && a2 == 0xEC000000656E6967 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

char *sub_100010A94(void *a1)
{
  uint64_t v41 = sub_100008BE0(&qword_10003CE20);
  uint64_t v45 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100008BE0(&qword_10003CE28);
  uint64_t v42 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008BE0(&qword_10003CE30);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008BE0(&qword_10003CE38);
  uint64_t v37 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008BE0(&qword_10003CE40);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  sub_100008C24(a1, v14);
  sub_100011628();
  uint64_t v15 = v47;
  sub_10002C9A0();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  id v36 = v9;
  uint64_t v16 = v43;
  Swift::String v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  unint64_t v20 = v13;
  uint64_t v21 = sub_10002C830();
  unint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_10002C6E0();
    swift_allocError();
    unint64_t v13 = v22;
    uint64_t v26 = v10;
    int v28 = v27;
    sub_100008BE0(&qword_10003CE48);
    void *v28 = &_s13ComputeDeviceV10DeviceTypeON;
    sub_10002C7D0();
    sub_10002C6D0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v28, enum case for DecodingError.typeMismatch(_:), v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v26);
LABEL_7:
    uint64_t v29 = (uint64_t)v46;
    goto LABEL_8;
  }
  unint64_t v13 = (char *)*(unsigned __int8 *)(v21 + 32);
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v49 = 1;
      sub_100011724();
      uint64_t v31 = v47;
      sub_10002C7C0();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_1000116D0();
      uint64_t v32 = v47;
      sub_10002C7C0();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_10001167C();
      uint64_t v33 = v47;
      sub_10002C7C0();
      if (v33) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
    default:
      char v48 = 0;
      sub_100011778();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_10002C7C0();
      if (v24)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v35);
LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
  }
LABEL_8:
  sub_1000112E4(v29);
  return v13;
}

uint64_t sub_1000110CC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10001115C()
{
  return 0x7954656369766564;
}

void *sub_100011178(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003CDA0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100008C24(a1, a1[3]);
  sub_10001085C();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100011334();
    sub_10002C820();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[15];
    sub_1000112E4((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1000112E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100011334()
{
  unint64_t result = qword_10003CDA8;
  if (!qword_10003CDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDA8);
  }
  return result;
}

uint64_t _s13ComputeDeviceV10CodingKeysOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s13ComputeDeviceV10CodingKeysOwst(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100011478);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000114A0()
{
  return 0;
}

ValueMetadata *_s13ComputeDeviceV10CodingKeysOMa()
{
  return &_s13ComputeDeviceV10CodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeON;
}

unint64_t sub_1000114CC()
{
  unint64_t result = qword_10003CDB0;
  if (!qword_10003CDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDB0);
  }
  return result;
}

unint64_t sub_100011524()
{
  unint64_t result = qword_10003CDB8;
  if (!qword_10003CDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDB8);
  }
  return result;
}

unint64_t sub_10001157C()
{
  unint64_t result = qword_10003CDC0;
  if (!qword_10003CDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDC0);
  }
  return result;
}

unint64_t sub_1000115D4()
{
  unint64_t result = qword_10003CDC8;
  if (!qword_10003CDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDC8);
  }
  return result;
}

unint64_t sub_100011628()
{
  unint64_t result = qword_10003CDF8;
  if (!qword_10003CDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDF8);
  }
  return result;
}

unint64_t sub_10001167C()
{
  unint64_t result = qword_10003CE00;
  if (!qword_10003CE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE00);
  }
  return result;
}

unint64_t sub_1000116D0()
{
  unint64_t result = qword_10003CE08;
  if (!qword_10003CE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE08);
  }
  return result;
}

unint64_t sub_100011724()
{
  unint64_t result = qword_10003CE10;
  if (!qword_10003CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE10);
  }
  return result;
}

unint64_t sub_100011778()
{
  unint64_t result = qword_10003CE18;
  if (!qword_10003CE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE18);
  }
  return result;
}

uint64_t _s13ComputeDeviceV10DeviceTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13ComputeDeviceV10DeviceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100011928);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO10CodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON;
}

unint64_t sub_1000119A4()
{
  unint64_t result = qword_10003CE50;
  if (!qword_10003CE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE50);
  }
  return result;
}

unint64_t sub_1000119FC()
{
  unint64_t result = qword_10003CE58;
  if (!qword_10003CE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE58);
  }
  return result;
}

unint64_t sub_100011A54()
{
  unint64_t result = qword_10003CE60;
  if (!qword_10003CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE60);
  }
  return result;
}

unint64_t sub_100011AAC()
{
  unint64_t result = qword_10003CE68;
  if (!qword_10003CE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE68);
  }
  return result;
}

unint64_t sub_100011B04()
{
  unint64_t result = qword_10003CE70;
  if (!qword_10003CE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE70);
  }
  return result;
}

unint64_t sub_100011B5C()
{
  unint64_t result = qword_10003CE78;
  if (!qword_10003CE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE78);
  }
  return result;
}

unint64_t sub_100011BB4()
{
  unint64_t result = qword_10003CE80;
  if (!qword_10003CE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE80);
  }
  return result;
}

unint64_t sub_100011C0C()
{
  unint64_t result = qword_10003CE88;
  if (!qword_10003CE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE88);
  }
  return result;
}

unint64_t sub_100011C64()
{
  unint64_t result = qword_10003CE90;
  if (!qword_10003CE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE90);
  }
  return result;
}

unint64_t sub_100011CBC()
{
  unint64_t result = qword_10003CE98;
  if (!qword_10003CE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE98);
  }
  return result;
}

unint64_t sub_100011D14()
{
  unint64_t result = qword_10003CEA0;
  if (!qword_10003CEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CEA0);
  }
  return result;
}

unint64_t sub_100011D6C(uint64_t a1, void *a2, char a3)
{
  switch(a3)
  {
    case 1:
      sub_10002C6B0(23);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000015;
      break;
    case 2:
      sub_10002C6B0(31);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD00000000000001DLL;
      break;
    case 3:
      sub_10002C6B0(20);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000012;
      break;
    default:
      sub_10002C6B0(24);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000016;
      break;
  }
  unint64_t v7 = v5;
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  sub_10002C510(v8);
  return v7;
}

char *sub_100011EBC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100009A98(0, a1 & ~(a1 >> 63), 0, (char *)&_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      int v8 = v11;
      unint64_t v10 = *((void *)i + 2);
      unint64_t v9 = *((void *)i + 3);
      if (v10 >= v9 >> 1) {
        i = sub_100009A98((char *)(v9 > 1), v10 + 1, 1, i);
      }
      *((void *)i + 2) = v10 + 1;
      *(_DWORD *)&i[4 * v10 + 32] = v8;
    }
    return i;
  }
  return result;
}

char *sub_100011F98(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100009BA8(0, a1 & ~(a1 >> 63), 0, (char *)&_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      int v8 = v11;
      unint64_t v10 = *((void *)i + 2);
      unint64_t v9 = *((void *)i + 3);
      if (v10 >= v9 >> 1) {
        i = sub_100009BA8((char *)(v9 > 1), v10 + 1, 1, i);
      }
      *((void *)i + 2) = v10 + 1;
      *(_DWORD *)&i[4 * v10 + 32] = v8;
    }
    return i;
  }
  return result;
}

char *sub_10001206C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100009988(0, a1 & ~(a1 >> 63), 0, (char *)&_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      uint64_t v8 = v11;
      unint64_t v10 = *((void *)i + 2);
      unint64_t v9 = *((void *)i + 3);
      if (v10 >= v9 >> 1) {
        i = sub_100009988((char *)(v9 > 1), v10 + 1, 1, i);
      }
      *((void *)i + 2) = v10 + 1;
      *(void *)&i[8 * v10 + 32] = v8;
    }
    return i;
  }
  return result;
}

char *sub_100012148(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100009CB8(0, a1 & ~(a1 >> 63), 0, (char *)&_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      uint64_t v8 = v11;
      unint64_t v10 = *((void *)i + 2);
      unint64_t v9 = *((void *)i + 3);
      if (v10 >= v9 >> 1) {
        i = sub_100009CB8((char *)(v9 > 1), v10 + 1, 1, i);
      }
      *((void *)i + 2) = v10 + 1;
      *(void *)&i[8 * v10 + 32] = v8;
    }
    return i;
  }
  return result;
}

char *sub_10001221C(uint64_t a1, uint64_t a2, void (*a3)(void *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100009DC8(0, a1 & ~(a1 >> 63), 0, (char *)&_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    for (i = result; v5; --v5)
    {
      a3(v13, a2);
      uint64_t v8 = v13[0];
      uint64_t v9 = v13[1];
      unint64_t v11 = *((void *)i + 2);
      unint64_t v10 = *((void *)i + 3);
      if (v11 >= v10 >> 1) {
        i = sub_100009DC8((char *)(v10 > 1), v11 + 1, 1, i);
      }
      *((void *)i + 2) = v11 + 1;
      uint64_t v12 = &i[16 * v11];
      *((void *)v12 + 4) = v8;
      *((void *)v12 + 5) = v9;
    }
    return i;
  }
  return result;
}

void *sub_1000122F8(uint64_t a1, uint64_t *a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  unint64_t result = &_swiftEmptyArrayStorage;
  if (v3)
  {
    int64_t v28 = v3;
    sub_100017994(0, v3, 0);
    int64_t v6 = v28;
    uint64_t v5 = a2;
    uint64_t v7 = 0;
    unint64_t result = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v8 = (char *)(a1 + 32 + 2 * v7);
      char v9 = *v8;
      unsigned __int8 v10 = v8[1] - *v8;
      if (v10 == 0xFF)
      {
        unint64_t v23 = *(void *)(*v5 + 16) - 0x61C8864680B583EBLL;
        *(void *)(*v5 + 16) = v23;
        unint64_t v24 = 0x94D049BB133111EBLL
            * ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) >> 27));
        char v22 = (v24 >> 31) ^ v24;
      }
      else
      {
        uint64_t v11 = *v5;
        uint64_t v12 = *(void *)(*v5 + 16);
        uint64_t v13 = v12 - 0x61C8864680B583EBLL;
        *(void *)(*v5 + 16) = v12 - 0x61C8864680B583EBLL;
        unint64_t v14 = 0xBF58476D1CE4E5B9
            * ((v12 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v12 - 0x61C8864680B583EBLL) >> 30));
        unsigned int v15 = (v10 + 1);
        unsigned int v16 = (((0x94D049BB133111EBLL * (v14 ^ (v14 >> 27))) >> 31) ^ (-21 * (v14 ^ (v14 >> 27))))
            * v15;
        unsigned int v17 = v16 >> 8;
        if (v10 >= v16)
        {
          unsigned int v18 = ~v10 % v15;
          if (v18 > v16)
          {
            unint64_t v19 = v12 + 0x3C6EF372FE94F82ALL;
            do
            {
              v13 -= 0x61C8864680B583EBLL;
              unint64_t v20 = 0x94D049BB133111EBLL
                  * ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) >> 27));
              unsigned int v21 = ((v20 >> 31) ^ v20) * v15;
              v19 -= 0x61C8864680B583EBLL;
            }
            while (v18 > v21);
            unsigned int v17 = v21 >> 8;
            *(void *)(v11 + 16) = v13;
          }
        }
        char v22 = v17 + v9;
      }
      if ((v22 & 0xFE) != 0) {
        char v25 = v22;
      }
      else {
        char v25 = 1;
      }
      uint64_t v30 = result;
      unint64_t v27 = result[2];
      unint64_t v26 = result[3];
      if (v27 >= v26 >> 1)
      {
        sub_100017994(v26 > 1, v27 + 1, 1);
        int64_t v6 = v28;
        uint64_t v5 = a2;
        unint64_t result = v30;
      }
      ++v7;
      result[2] = v27 + 1;
      *((unsigned char *)result + v27 + 32) = v25;
    }
    while (v7 != v6);
  }
  return result;
}

unint64_t sub_100012520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 - a2 != -1) {
    return sub_100013990(a3 - a2 + 1) + a2;
  }
  unint64_t v4 = *(void *)(*(void *)a1 + 16) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)a1 + 16) = v4;
  unint64_t v5 = (0xBF58476D1CE4E5B9 * (v4 ^ (v4 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v4 ^ (v4 >> 30))) >> 27);
  return (0x94D049BB133111EBLL * v5) ^ ((0x94D049BB133111EBLL * v5) >> 31);
}

__CVBuffer *sub_1000125B4(uint64_t a1, uint64_t a2)
{
  long long v12 = *(_OWORD *)(a2 + 8);
  ((void (*)(long long *__return_ptr))v12)(&v11);
  long long v4 = v11;
  unint64_t v5 = (long long *)(a2 + 24);
  if (*(_DWORD *)a2 == 1278226536)
  {
    int64_t v6 = sub_10000F2AC(v11, *((size_t *)&v11 + 1), 0x4C303038u);
    long long v11 = *v5;
    long long v7 = v11;
    sub_10001687C((uint64_t)&v12);
    sub_10001687C((uint64_t)&v11);
    sub_10000F3F4(v6, (void (*)(uint64_t *__return_ptr, uint64_t))v7, *((uint64_t *)&v7 + 1), a1);
    sub_1000168A8((uint64_t)&v12);
    sub_1000168A8((uint64_t)&v11);
    uint64_t v8 = (__CVBuffer *)sub_10000F584(v6, v4, *((size_t *)&v4 + 1));
  }
  else
  {
    uint64_t v8 = sub_10000F2AC(v11, *((size_t *)&v11 + 1), *(_DWORD *)a2);
    long long v11 = *v5;
    long long v9 = v11;
    sub_10001687C((uint64_t)&v12);
    sub_10001687C((uint64_t)&v11);
    sub_10000F3F4(v8, (void (*)(uint64_t *__return_ptr, uint64_t))v9, *((uint64_t *)&v9 + 1), a1);
    sub_1000168A8((uint64_t)&v12);
    sub_1000168A8((uint64_t)&v11);
  }
  return v8;
}

uint64_t sub_1000126F0(uint64_t a1, uint64_t a2)
{
  if (HIDWORD(a2) - a2 != -1) {
    return sub_100013A5C((HIDWORD(a2) - a2 + 1)) + a2;
  }
  unint64_t v3 = *(void *)(*(void *)a1 + 16) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)a1 + 16) = v3;
  unint64_t v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
  return (v4 >> 31) ^ v4;
}

void sub_10001278C(float a1, float a2)
{
  if ((~COERCE_INT(a2 - a1) & 0x7F800000) != 0) {
    sub_100013A5C(0x1000001uLL);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_10001280C(uint64_t a1, void (*a2)(char **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_100008BE0(&qword_10003CF20);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v20 - v12;
  a2(&v21, a1);
  uint64_t v14 = *((void *)v21 + 2);
  if (v14)
  {
    unsigned int v15 = (uint64_t *)(v21 + 32);
    uint64_t v16 = 1;
    while (1)
    {
      uint64_t v17 = *v15++;
      uint64_t result = v16 * v17;
      if ((unsigned __int128)(v16 * (__int128)v17) >> 64 != (v16 * v17) >> 63) {
        break;
      }
      uint64_t v16 = result;
      if (!--v14) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t result = 1;
LABEL_7:
    unsigned int v21 = sub_100011F98(result, a1, a4);
    sub_100008BE0(&qword_10003CF28);
    sub_100016A54(&qword_10003CF30, &qword_10003CF28);
    sub_10002C1F0();
    sub_10000D040(0, &qword_10003CEF0);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_100016A54(&qword_10003CF38, &qword_10003CF20);
    uint64_t v19 = sub_10002C5B0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v19;
  }
  return result;
}

uint64_t sub_100012A58(uint64_t a1, void (*a2)(char **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_100008BE0(&qword_10003CF00);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v20 - v12;
  a2(&v21, a1);
  uint64_t v14 = *((void *)v21 + 2);
  if (v14)
  {
    unsigned int v15 = (uint64_t *)(v21 + 32);
    uint64_t v16 = 1;
    while (1)
    {
      uint64_t v17 = *v15++;
      uint64_t result = v16 * v17;
      if ((unsigned __int128)(v16 * (__int128)v17) >> 64 != (v16 * v17) >> 63) {
        break;
      }
      uint64_t v16 = result;
      if (!--v14) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t result = 1;
LABEL_7:
    unsigned int v21 = sub_100011EBC(result, a1, a4);
    sub_100008BE0(&qword_10003CF08);
    sub_100016A54(&qword_10003CF10, &qword_10003CF08);
    sub_10002C1F0();
    sub_10000D040(0, &qword_10003CEF0);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_100016A54(&qword_10003CF18, &qword_10003CF00);
    uint64_t v19 = sub_10002C5B0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v19;
  }
  return result;
}

uint64_t sub_100012CA4(uint64_t a1, void (*a2)(char **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_100008BE0(&qword_10003CED8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v20 - v12;
  a2(&v21, a1);
  uint64_t v14 = *((void *)v21 + 2);
  if (v14)
  {
    unsigned int v15 = (uint64_t *)(v21 + 32);
    uint64_t v16 = 1;
    while (1)
    {
      uint64_t v17 = *v15++;
      uint64_t result = v16 * v17;
      if ((unsigned __int128)(v16 * (__int128)v17) >> 64 != (v16 * v17) >> 63) {
        break;
      }
      uint64_t v16 = result;
      if (!--v14) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t result = 1;
LABEL_7:
    unsigned int v21 = sub_10001206C(result, a1, a4);
    sub_100008BE0(&qword_10003CEE0);
    sub_100016A54(&qword_10003CEE8, &qword_10003CEE0);
    sub_10002C1F0();
    sub_10000D040(0, &qword_10003CEF0);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_100016A54(&qword_10003CEF8, &qword_10003CED8);
    uint64_t v19 = sub_10002C5B0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v19;
  }
  return result;
}

id sub_100012EF0()
{
  sub_10000D040(0, (unint64_t *)&qword_10003CD70);
  Class isa = sub_10002C430().super.isa;
  swift_bridgeObjectRelease();
  id v5 = 0;
  id v1 = [(id)swift_getObjCClassFromMetadata() featureValueWithDictionary:isa error:&v5];

  if (v1)
  {
    id v2 = v5;
  }
  else
  {
    id v3 = v5;
    sub_10002BF90();

    swift_willThrow();
  }
  return v1;
}

id sub_100012FF8(uint64_t a1, uint64_t a2)
{
  void (*v13)(void **__return_ptr, uint64_t);
  void *v14;
  char isUniquelyReferenced_nonNull_native;
  char v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  id result;
  uint64_t v30;
  void *v32;

  swift_bridgeObjectRetain();
  uint64_t v32 = sub_100013B34(a2);
  sub_100013C1C((uint64_t *)&v32);
  swift_bridgeObjectRelease();
  id v3 = v32;
  uint64_t v4 = v32[2];
  if (!v4)
  {
    int64_t v6 = _swiftEmptyDictionarySingleton;
LABEL_20:
    swift_release();
    sub_1000132C8((uint64_t)v6);
    swift_bridgeObjectRelease();
    int64_t v28 = objc_allocWithZone((Class)MLDictionaryFeatureProvider);
    return sub_100013758();
  }
  swift_retain();
  id v5 = v3 + 5;
  int64_t v6 = _swiftEmptyDictionarySingleton;
  uint64_t v30 = a2;
  while (*(void *)(a2 + 16))
  {
    uint64_t v9 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain_n();
    unint64_t v10 = sub_1000173E0(v9, v8);
    if ((v11 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v12 = v4;
    uint64_t v13 = *(void (**)(void **__return_ptr, uint64_t))(*(void *)(a2 + 56) + 16 * v10);
    swift_retain();
    v13(&v32, a1);
    swift_release();
    uint64_t v14 = v32;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v32 = v6;
    uint64_t v17 = sub_1000173E0(v9, v8);
    unsigned int v18 = v6[2];
    uint64_t v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      goto LABEL_24;
    }
    unsigned int v21 = v16;
    if (v6[3] >= v20)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        int64_t v6 = v32;
        if (v16) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_100019338();
        int64_t v6 = v32;
        if (v21) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_100018BA0(v20, isUniquelyReferenced_nonNull_native);
      char v22 = sub_1000173E0(v9, v8);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_26;
      }
      uint64_t v17 = v22;
      int64_t v6 = v32;
      if (v21)
      {
LABEL_3:
        uint64_t v7 = v6[7];

        *(void *)(v7 + 8 * v17) = v14;
        goto LABEL_4;
      }
    }
    v6[(v17 >> 6) + 8] |= 1 << v17;
    unint64_t v24 = (uint64_t *)(v6[6] + 16 * v17);
    uint8_t *v24 = v9;
    v24[1] = v8;
    *(void *)(v6[7] + 8 * v17) = v14;
    char v25 = v6[2];
    unint64_t v26 = __OFADD__(v25, 1);
    unint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_25;
    }
    v6[2] = v27;
    swift_bridgeObjectRetain();
LABEL_4:
    v5 += 2;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v4 = v12 - 1;
    a2 = v30;
    if (v12 == 1)
    {
      swift_release();
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  sub_10002C910();
  __break(1u);
  swift_release();
  __break(1u);
  uint64_t result = (id)swift_unexpectedError();
  __break(1u);
  return result;
}

unint64_t sub_1000132C8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100008BE0(&qword_10003CEB0);
    id v2 = (void *)sub_10002C790();
  }
  else
  {
    id v2 = _swiftEmptyDictionarySingleton;
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  int64_t v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  uint64_t v9 = &qword_10003CEB8;
  unint64_t v10 = MLFeatureValue_ptr;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v34 + 1;
  if (__OFADD__(v34, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v32) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v33 + 8 * v19);
  int64_t v21 = v34 + 1;
  if (!v20)
  {
    int64_t v21 = v34 + 2;
    if (v34 + 2 >= v32) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v33 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v34 + 3;
      if (v34 + 3 >= v32) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v33 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v34 + 4;
        if (v34 + 4 >= v32) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v33 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v34 + 5;
          if (v34 + 5 < v32)
          {
            unint64_t v20 = *(void *)(v33 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v34 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v32) {
                break;
              }
              unint64_t v20 = *(void *)(v33 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1000165C4();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v34 = v21;
  uint64_t v35 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v34 << 6))
  {
    unint64_t v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    unint64_t v24 = *(void **)(*(void *)(v1 + 56) + 8 * i);
    uint64_t v36 = *v23;
    uint64_t v37 = v23[1];
    sub_10000D040(0, v9);
    swift_bridgeObjectRetain();
    id v25 = v24;
    swift_dynamicCast();
    sub_1000165B4(v6, v7);
    sub_1000165B4(v7, v41);
    sub_1000165B4(v41, &v39);
    unint64_t result = sub_1000173E0(v36, v37);
    unint64_t v26 = result;
    if (v27)
    {
      char v11 = v7;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      uint64_t v14 = v10;
      unsigned int v15 = v9;
      uint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v16 = v36;
      v16[1] = v37;
      uint64_t v9 = v15;
      unint64_t v10 = v14;
      uint64_t v1 = v13;
      int64_t v6 = v12;
      uint64_t v7 = v11;
      uint64_t v17 = (_OWORD *)(v2[7] + 32 * v26);
      sub_1000112E4((uint64_t)v17);
      unint64_t result = (unint64_t)sub_1000165B4(&v39, v17);
      unint64_t v5 = v35;
      if (!v35) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v28 = v36;
    v28[1] = v37;
    unint64_t result = (unint64_t)sub_1000165B4(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_34;
    }
    v2[2] = v31;
    unint64_t v5 = v35;
    if (!v35) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v35 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void sub_100013648(void *a1@<X8>)
{
  swift_bridgeObjectRetain();
  Class isa = sub_10002C550().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [self sequenceWithStringArray:isa];

  *a1 = v3;
}

void sub_1000136C4(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_10000F1D0(*a1);
  sub_10000D040(0, (unint64_t *)&qword_10003CD70);
  Class isa = sub_10002C550().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [self sequenceWithInt64Array:isa];

  *a2 = v4;
}

id sub_100013758()
{
  Class isa = sub_10002C430().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithDictionary:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_10002BF90();

    swift_willThrow();
  }
  return v2;
}

id sub_100013840(uint64_t a1)
{
  id v2 = v1;
  sub_10002BFF0(__stack_chk_guard);
  unint64_t v5 = v4;
  id v14 = 0;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_10002C030();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_10002BF90();

    swift_willThrow();
    uint64_t v12 = sub_10002C030();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

unint64_t sub_100013990(unint64_t result)
{
  if (result)
  {
    uint64_t v2 = *v1;
    uint64_t v3 = *(void *)(*v1 + 16);
    uint64_t v4 = v3 - 0x61C8864680B583EBLL;
    *(void *)(*v1 + 16) = v3 - 0x61C8864680B583EBLL;
    unint64_t v5 = 0xBF58476D1CE4E5B9 * ((v3 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v3 - 0x61C8864680B583EBLL) >> 30));
    unint64_t v6 = (0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) ^ ((0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) >> 31);
    unint64_t v7 = v6 * result;
    uint64_t v8 = (v6 * (unsigned __int128)result) >> 64;
    if (v7 < result)
    {
      unint64_t v9 = -(uint64_t)result % result;
      if (v9 > v7)
      {
        unint64_t v10 = v3 + 0x3C6EF372FE94F82ALL;
        do
        {
          v4 -= 0x61C8864680B583EBLL;
          unint64_t v11 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9 * (v10 ^ (v10 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v10 ^ (v10 >> 30))) >> 27));
          unint64_t v12 = v11 ^ (v11 >> 31);
          v10 -= 0x61C8864680B583EBLL;
        }
        while (v9 > v12 * result);
        uint64_t v8 = (v12 * (unsigned __int128)result) >> 64;
        *(void *)(v2 + 16) = v4;
      }
    }
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100013A5C(unint64_t result)
{
  if (result)
  {
    uint64_t v2 = *v1;
    uint64_t v3 = *(void *)(*v1 + 16);
    uint64_t v4 = v3 - 0x61C8864680B583EBLL;
    *(void *)(*v1 + 16) = v3 - 0x61C8864680B583EBLL;
    unint64_t v5 = 0xBF58476D1CE4E5B9 * ((v3 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v3 - 0x61C8864680B583EBLL) >> 30));
    unint64_t v6 = result
       * (unint64_t)(((0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) >> 31) ^ (321982955
                                                                                              * (v5 ^ (v5 >> 27))));
    unint64_t v7 = HIDWORD(v6);
    if (v6 < result)
    {
      unsigned int v8 = -(int)result % result;
      if (v8 > v6)
      {
        unint64_t v9 = v3 + 0x3C6EF372FE94F82ALL;
        do
        {
          v4 -= 0x61C8864680B583EBLL;
          unint64_t v10 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
          int64_t v11 = result * (unint64_t)((v10 >> 31) ^ v10);
          v9 -= 0x61C8864680B583EBLL;
        }
        while (v8 > v11);
        unint64_t v7 = v11 >> 32;
        *(void *)(v2 + 16) = v4;
      }
    }
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100013B34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100008BE0(&qword_10003CAE8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000148AC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000165C4();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

Swift::Int sub_100013C1C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014AAC(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_100013C88(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_100013C88(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_10002C8D0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_100014374(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      int64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_100014444((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_100014898((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_10002C570();
    *(void *)(v7 + 16) = v6;
    v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  int64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    id v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_10002C900();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    int64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      unint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_10002C900()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_1000146E0(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      int64_t v11 = sub_1000146E0((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          char v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        int64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        v85 = v11;
        v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        v88 = v42;
        unint64_t v89 = v44;
        v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_100014444((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        int64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        int64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_10002C900() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = sub_10002C740();
  __break(1u);
  return result;
}

uint64_t sub_100014374(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_10002C900(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100014444(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        unsigned int v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_10002C900() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)unsigned int v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)unsigned int v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    id v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_10002C900() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_1000147DC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

char *sub_1000146E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CEC0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1000147DC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_10002C7A0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_100014898(uint64_t a1)
{
  return sub_1000146E0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000148AC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    Swift::Int v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100014AAC(uint64_t a1)
{
  return sub_100017EBC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_100014AC0(double *a1@<X1>, double *a2@<X8>)
{
  double v4 = *a1;
  double v3 = a1[1];
  double v5 = v3 - *a1;
  if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
  {
    unint64_t v6 = sub_100013990(0x20000000000001uLL);
    double v7 = v4 + v5 * ((double)v6 * 1.11022302e-16);
    if (v6 == 0x20000000000000) {
      double v7 = v3;
    }
    *a2 = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100014B44@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  double v5 = sub_1000122F8(v4, a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

unint64_t sub_100014BA4@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  unint64_t result = *(void *)(*a1 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  unint64_t result = sub_100013990(result);
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result < *(void *)(v2 + 16))
  {
    *a2 = *(void *)(v2 + 8 * result + 32);
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100014C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t *)@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  (*(void (**)(uint64_t *__return_ptr))a2)(&v13);
  uint64_t v12 = a4(v13 & ~(v13 >> 63), a1, v9, v10);
  a3(&v13, &v12);
  uint64_t result = swift_bridgeObjectRelease();
  *a5 = v13;
  return result;
}

unint64_t sub_100014CB4@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  unint64_t result = *(void *)(*a1 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  unint64_t result = sub_100013990(result);
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result >= *(void *)(v2 + 16))
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v5 = v2 + 16 * result;
  uint64_t v6 = *(void *)(v5 + 40);
  *a2 = *(void *)(v5 + 32);
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

id sub_100014D28(uint64_t a1, void (**a2)(uint64_t *__return_ptr, uint64_t))
{
  void (*v3)(uint64_t *__return_ptr, uint64_t);
  uint64_t v5;

  double v3 = *a2;
  sub_10000D040(0, &qword_10003CEB8);
  v3(&v5, a1);
  return sub_100012EF0();
}

id sub_100014DBC(uint64_t a1, void (**a2)(void **__return_ptr), SEL *a3)
{
  (*a2)(&v7);
  uint64_t v4 = v7;
  id v5 = [self *a3:v7];

  return v5;
}

id sub_100014E24(uint64_t a1, void (**a2)(uint64_t *__return_ptr))
{
  (*a2)(&v5);
  swift_bridgeObjectRetain();
  NSString v2 = sub_10002C450();
  swift_bridgeObjectRelease();
  id v3 = [self featureValueWithString:v2];
  swift_bridgeObjectRelease();

  return v3;
}

id sub_100014EBC(uint64_t a1, void (**a2)(uint64_t *__return_ptr))
{
  (*a2)(&v4);
  id v2 = [self featureValueWithInt64:v4];
  return v2;
}

id sub_100014F24(uint64_t a1, void (**a2)(double *__return_ptr))
{
  (*a2)(&v4);
  id v2 = [self featureValueWithDouble:v4];
  return v2;
}

__CVBuffer *(*sub_100014F94(void *a1))@<X0>(uint64_t a1@<X0>, __CVBuffer **a2@<X8>)
{
  unint64_t result = (__CVBuffer *(*)@<X0>(uint64_t@<X0>, __CVBuffer **@<X8>))[a1 constraint];
  if (result)
  {
    self;
    id v2 = (void *)swift_dynamicCastObjCClassUnconditional();
    unsigned int v3 = [v2 pixelFormatType];
    id v4 = [v2 imageSize];
    id v5 = [v4 pixelsWide];

    id v6 = [v2 imageSize];
    id v7 = [v6 pixelsHigh];

    sub_100008BE0(&qword_10003CED0);
    uint64_t v8 = sub_10002C570();
    *(void *)(v8 + 16) = 4;
    *(void *)(v8 + 32) = 0xFF00FF00FF00FF00;
    swift_unknownObjectRelease();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    *(void *)(v9 + 24) = v7;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    uint64_t v11 = swift_allocObject();
    *(_DWORD *)(v11 + 16) = v3;
    *(void *)(v11 + 24) = sub_1000167E4;
    *(void *)(v11 + 32) = v9;
    *(void *)(v11 + 40) = sub_1000167F0;
    *(void *)(v11 + 48) = v10;
    return sub_100016838;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*sub_100015148(void *a1))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t result = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))[a1 constraint];
  if (result)
  {
    self;
    unsigned int v3 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v4 = [v3 shape];
    sub_10000D040(0, (unint64_t *)&qword_10003CD70);
    unint64_t v5 = sub_10002C560();

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_10002C760();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    id v30 = a1;
    id v31 = v3;
    if (v6)
    {
      Swift::Int v32 = (unint64_t *)&_swiftEmptyArrayStorage;
      id v7 = (void **)&v32;
      sub_1000179B4(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v8 = 0;
      uint64_t v9 = v32;
      do
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v10 = (id)sub_10002C6C0();
        }
        else {
          id v10 = *(id *)(v5 + 8 * v8 + 32);
        }
        uint64_t v11 = v10;
        id v12 = [v10 integerValue:v30];

        Swift::Int v32 = v9;
        unint64_t v14 = v9[2];
        unint64_t v13 = v9[3];
        if (v14 >= v13 >> 1)
        {
          sub_1000179B4(v13 > 1, v14 + 1, 1);
          uint64_t v9 = v32;
        }
        ++v8;
        v9[2] = v14 + 1;
        v9[v14 + 4] = (unint64_t)v12;
      }
      while (v6 != v8);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    id v7 = (void **)swift_allocObject();
    v7[2] = v9;
    uint64_t v15 = (uint64_t)[v31 dataType];
    if (v15 > 65599)
    {
      if (v15 == 65600)
      {
        swift_unknownObjectRelease();
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_10002E5A0;
        unint64_t v24 = (void *)swift_allocObject();
        void v24[2] = sub_100016F3C;
        v24[3] = v7;
        v24[4] = sub_100016F38;
        v24[5] = v23;
        return sub_100016A3C;
      }
      if (v15 == 131104)
      {
        swift_unknownObjectRelease();
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 16) = 0xFF00000000;
        Swift::Int v20 = (void *)swift_allocObject();
        v20[2] = sub_100016F3C;
        id v20[3] = v7;
        v20[4] = sub_1000168E4;
        v20[5] = v19;
        return sub_100016914;
      }
      goto LABEL_26;
    }
    if (v15 != 65552)
    {
      if (v15 == 65568)
      {
        swift_unknownObjectRelease();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = 0x3F80000000000000;
        int64_t v17 = (void *)swift_allocObject();
        v17[2] = sub_100016F3C;
        v17[3] = v7;
        v17[4] = sub_100016F34;
        v17[5] = v16;
        return sub_1000169D0;
      }
LABEL_26:
      id v25 = [v30 name];
      uint64_t v26 = sub_10002C480();
      uint64_t v28 = v27;

      sub_1000165CC();
      swift_allocError();
      *(void *)uint64_t v29 = v26;
      *(void *)(v29 + 8) = v28;
      *(unsigned char *)(v29 + 16) = 1;
      swift_willThrow();
      swift_unknownObjectRelease();
      return (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))swift_release();
    }
    sub_10002C5F0();
    if (qword_10003C908 == -1)
    {
LABEL_23:
      sub_10002C0A0();
      swift_unknownObjectRelease();
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = 0x3F80000000000000;
      uint64_t v22 = (void *)swift_allocObject();
      v22[2] = sub_100016F3C;
      v22[3] = v7;
      _OWORD v22[4] = sub_10001693C;
      v22[5] = v21;
      return sub_10001696C;
    }
LABEL_29:
    swift_once();
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1000156A8(void *a1))()
{
  unint64_t result = (uint64_t (*)())[a1 constraint];
  if (result)
  {
    self;
    id v4 = [(id)swift_dynamicCastObjCClassUnconditional() keyType];
    if (v4 == (id)1)
    {
      sub_100008BE0(&qword_10003CF40);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002E5B0;
      sub_10002C690();
      sub_10000D040(0, (unint64_t *)&qword_10003CD70);
      *(NSNumber *)(inited + 72) = sub_10002C630(0.0);
      sub_10002C690();
      uint64_t v1 = (uint64_t (*)())sub_100016A98;
    }
    else
    {
      if (v4 != (id)3)
      {
        id v7 = [a1 name];
        uint64_t v8 = sub_10002C480();
        uint64_t v10 = v9;

        sub_1000165CC();
        swift_allocError();
        *(void *)uint64_t v11 = v8;
        *(void *)(v11 + 8) = v10;
        *(unsigned char *)(v11 + 16) = 3;
        swift_willThrow();
        swift_unknownObjectRelease();
        return v1;
      }
      sub_100008BE0(&qword_10003CF40);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002E5B0;
      sub_10002C690();
      sub_10000D040(0, (unint64_t *)&qword_10003CD70);
      *(NSNumber *)(inited + 72) = sub_10002C630(0.0);
      sub_10002C690();
      uint64_t v1 = sub_100016F3C;
    }
    *(NSNumber *)(inited + 120) = sub_10002C630(1.0);
    unint64_t v6 = sub_1000172B4(inited);
    swift_unknownObjectRelease();
    *(void *)(swift_allocObject() + 16) = v6;
    return v1;
  }
  __break(1u);
  return result;
}

id sub_100015964(void *a1)
{
  id result = [a1 constraint];
  if (result)
  {
    self;
    unsigned int v3 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v4 = [v3 countRange];
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v4;
    id v5 = [v3 valueDescription];
    id v6 = [v5 type];
    id v7 = sub_100016B00;
    uint64_t v8 = sub_100016ACC;
    uint64_t v9 = sub_1000136C4;
    if (v6 == (id)1)
    {
      uint64_t v11 = sub_100016AC0;
      uint64_t v10 = &off_100039068;
    }
    else
    {
      if (v6 != (id)3)
      {
        id v15 = [a1 name];
        uint64_t v16 = sub_10002C480();
        id v7 = v17;

        sub_1000165CC();
        swift_allocError();
        *(void *)uint64_t v18 = v16;
        *(void *)(v18 + 8) = v7;
        *(unsigned char *)(v18 + 16) = 2;
        swift_willThrow();
        swift_unknownObjectRelease();
        swift_release();

        return v7;
      }
      sub_100008BE0(&qword_10003CAE8);
      uint64_t v10 = (_UNKNOWN **)swift_allocObject();
      *((_OWORD *)v10 + 1) = xmmword_10002E5C0;
      v10[4] = (_UNKNOWN *)97;
      v10[5] = (_UNKNOWN *)0xE100000000000000;
      v10[6] = (_UNKNOWN *)98;
      v10[7] = (_UNKNOWN *)0xE100000000000000;
      v10[8] = (_UNKNOWN *)99;
      v10[9] = (_UNKNOWN *)0xE100000000000000;
      id v7 = sub_100016B00;
      uint64_t v8 = sub_100016B58;
      uint64_t v9 = sub_100013648;
      uint64_t v11 = sub_100016B04;
    }
    swift_unknownObjectRelease();

    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v10;
    unint64_t v13 = (void *)swift_allocObject();
    void v13[2] = sub_100016AB4;
    v13[3] = v19;
    v13[4] = v11;
    v13[5] = v12;
    v13[6] = v9;
    v13[7] = 0;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v8;
    *(void *)(v14 + 24) = v13;
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_100015C7C(void *a1))@<X0>(uint64_t *@<X8>)
{
  switch((unint64_t)[a1 type])
  {
    case 1uLL:
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_10002E5E0;
      id v2 = sub_100016644;
      id v5 = sub_10001677C;
      id v6 = sub_100016750;
      break;
    case 2uLL:
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_10002E5A0;
      id v2 = sub_100016644;
      id v5 = sub_10001679C;
      id v6 = sub_100016794;
      break;
    case 3uLL:
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_10002E5D0;
      *(void *)(v4 + 32) = 0xD00000000000003DLL;
      *(void *)(v4 + 40) = 0x8000000100031460;
      id v2 = sub_100016644;
      id v5 = sub_100016738;
      id v6 = sub_100016708;
      break;
    case 4uLL:
      uint64_t v11 = sub_100014F94(a1);
      if (v1) {
        return v2;
      }
      id v6 = v11;
      uint64_t v4 = v12;
      id v2 = sub_100016644;
      id v5 = sub_1000166AC;
      break;
    case 5uLL:
      unint64_t v13 = sub_100015148(a1);
      if (v1) {
        return v2;
      }
      id v6 = v13;
      uint64_t v4 = v14;
      id v2 = sub_100016644;
      id v5 = sub_100016688;
      break;
    case 6uLL:
      id v15 = sub_1000156A8(a1);
      if (v1) {
        return v2;
      }
      id v6 = v15;
      uint64_t v4 = v16;
      id v2 = sub_100016644;
      id v5 = sub_100016648;
      break;
    case 7uLL:
      id v17 = sub_100015964(a1);
      if (v1) {
        return v2;
      }
      id v6 = v17;
      uint64_t v4 = v18;
      id v2 = sub_100016644;
      id v5 = sub_100016620;
      break;
    default:
      id v7 = [a1 name];
      uint64_t v8 = sub_10002C480();
      id v2 = v9;

      sub_1000165CC();
      swift_allocError();
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v2;
      *(unsigned char *)(v10 + 16) = 0;
      swift_willThrow();
      return v2;
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v6;
  *(void *)(v19 + 24) = v4;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v5;
  *(void *)(v20 + 24) = v19;
  return v2;
}

void *sub_100016078(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t isUniquelyReferenced_nonNull_native = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10002C760();
    if (v6) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    return &_swiftEmptyDictionarySingleton;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_28;
  }
LABEL_3:
  unint64_t v36 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
  uint64_t v7 = 4;
  uint64_t v35 = v6;
  while (1)
  {
    if (v36) {
      id v11 = (id)sub_10002C6C0();
    }
    else {
      id v11 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v7);
    }
    uint64_t v12 = v11;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v40 = v7 - 3;
    id v13 = [v11 name];
    uint64_t v14 = sub_10002C480();
    uint64_t v16 = v15;

    if (a2[2])
    {
      swift_bridgeObjectRetain();
      sub_1000173E0(v14, v16);
      swift_bridgeObjectRelease();
    }
    id v17 = sub_100015C7C(v12);
    if (v3)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
    Swift::Int v37 = v17;
    uint64_t v38 = v18;
    BOOL v39 = v12;
    uint64_t v19 = v7;
    uint64_t v20 = a2;
    uint64_t v21 = isUniquelyReferenced_nonNull_native;
    a2 = &_swiftEmptyDictionarySingleton;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v23 = sub_1000173E0(v14, v16);
    uint64_t v24 = *((void *)&_swiftEmptyDictionarySingleton + 2);
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      goto LABEL_25;
    }
    uint64_t v3 = v22;
    if (*((void *)&_swiftEmptyDictionarySingleton + 3) < v26) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10001918C();
    }
LABEL_19:
    uint64_t isUniquelyReferenced_nonNull_native = v21;
    a2 = v20;
    if (v3)
    {
      uint64_t v8 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(*((void *)&_swiftEmptyDictionarySingleton + 7) + 16 * v23);
      void *v8 = v37;
      v8[1] = v38;
      swift_release();
      uint64_t v9 = v35;
      uint64_t v10 = v39;
    }
    else
    {
      *((void *)&_swiftEmptyDictionarySingleton + (v23 >> 6) + 8) |= 1 << v23;
      uint64_t v29 = (uint64_t *)(*((void *)&_swiftEmptyDictionarySingleton + 6) + 16 * v23);
      uint64_t *v29 = v14;
      v29[1] = v16;
      id v30 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(*((void *)&_swiftEmptyDictionarySingleton + 7) + 16 * v23);
      uint64_t v10 = v39;
      *id v30 = v37;
      v30[1] = v38;
      uint64_t v31 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      uint64_t v9 = v35;
      if (v32) {
        goto LABEL_26;
      }
      *((void *)&_swiftEmptyDictionarySingleton + 2) = v33;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = v19 + 1;
    uint64_t v3 = 0;
    if (v40 == v9) {
      goto LABEL_28;
    }
  }
  sub_1000188B4(v26, isUniquelyReferenced_nonNull_native);
  unint64_t v27 = sub_1000173E0(v14, v16);
  if ((v3 & 1) == (v28 & 1))
  {
    unint64_t v23 = v27;
    goto LABEL_19;
  }
  id result = (void *)sub_10002C910();
  __break(1u);
  return result;
}

void sub_100016390(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_10002C030();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  id v9 = objc_allocWithZone((Class)MIOModel);
  id v10 = sub_100013840((uint64_t)v7);
  if (!v2)
  {
    id v11 = v10;
    id v12 = [v10 modelDescription];
    id v13 = [v12 inputDescriptions];

    sub_10000D040(0, &qword_10003CEA8);
    unint64_t v14 = sub_10002C560();

    id v15 = v11;
    uint64_t v16 = sub_100016078(v14, a2);
    swift_bridgeObjectRelease();

    *(void *)(swift_allocObject() + 16) = v16;
  }
}

uint64_t sub_100016550()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100016588@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = sub_100012FF8(a1, *(void *)(v2 + 16));
  *a2 = result;
  return result;
}

_OWORD *sub_1000165B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000165C4()
{
  return swift_release();
}

unint64_t sub_1000165CC()
{
  unint64_t result = qword_10003CEC8;
  if (!qword_10003CEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CEC8);
  }
  return result;
}

id sub_100016620(uint64_t a1)
{
  return sub_100014DBC(a1, (void (**)(void **__return_ptr))(v1 + 16), (SEL *)&selRef_featureValueWithSequence_);
}

id sub_100016648(uint64_t a1)
{
  return sub_100014D28(a1, (void (**)(uint64_t *__return_ptr, uint64_t))(v1 + 16));
}

uint64_t sub_100016650()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

id sub_100016688(uint64_t a1)
{
  return sub_100014DBC(a1, (void (**)(void **__return_ptr))(v1 + 16), (SEL *)&selRef_featureValueWithMultiArray_);
}

id sub_1000166AC(uint64_t a1)
{
  return sub_100014DBC(a1, (void (**)(void **__return_ptr))(v1 + 16), (SEL *)&selRef_featureValueWithPixelBuffer_);
}

uint64_t sub_1000166D0()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016708@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000E570(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
  *a2 = result;
  a2[1] = v5;
  return result;
}

id sub_100016738(uint64_t a1)
{
  return sub_100014E24(a1, (void (**)(uint64_t *__return_ptr))(v1 + 16));
}

uint64_t sub_100016740()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_100016750@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_100012520(a1, *(void *)(v2 + 16), *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

id sub_10001677C(uint64_t a1)
{
  return sub_100014EBC(a1, (void (**)(uint64_t *__return_ptr))(v1 + 16));
}

uint64_t sub_100016784()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100016794(double *a1@<X8>)
{
  sub_100014AC0((double *)(v1 + 16), a1);
}

id sub_10001679C(uint64_t a1)
{
  return sub_100014F24(a1, (void (**)(double *__return_ptr))(v1 + 16));
}

uint64_t sub_1000167A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1000167D4()
{
  return _swift_deallocObject(v0, 32, 7);
}

__n128 sub_1000167E4@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

uint64_t sub_1000167F0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100014B44(a1, a2);
}

uint64_t sub_1000167F8()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

__CVBuffer *sub_100016838@<X0>(uint64_t a1@<X0>, __CVBuffer **a2@<X8>)
{
  long long v4 = *(_OWORD *)(v2 + 32);
  v6[0] = *(_OWORD *)(v2 + 16);
  v6[1] = v4;
  uint64_t v7 = *(void *)(v2 + 48);
  __n128 result = sub_1000125B4(a1, (uint64_t)v6);
  *a2 = result;
  return result;
}

uint64_t sub_10001687C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000168A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000168D4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000168E4@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = sub_1000126F0(a1, *(void *)(v2 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_100016914@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100016984(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10001280C, a2);
}

uint64_t sub_10001692C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001693C(_DWORD *a1@<X8>)
{
  sub_10001278C(*(float *)(v1 + 16), *(float *)(v1 + 20));
  *a1 = v3;
}

uint64_t sub_10001696C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100016984(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10000EAE8, a2);
}

uint64_t sub_100016984@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void, void, void, void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(a1, v3[2], v3[3], v3[4], v3[5]);
  *a3 = result;
  return result;
}

uint64_t sub_1000169BC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000169D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100016984(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_100012A58, a2);
}

uint64_t sub_1000169E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000169FC()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016A3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100016984(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_100012CA4, a2);
}

uint64_t sub_100016A54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016A98@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100016AA4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100016AB4(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

unint64_t sub_100016AC0@<X0>(void *a1@<X8>)
{
  return sub_100014BA4((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_100016ACC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100014C08(a1, v2 + 16, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 48), (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100012148, a2);
}

unint64_t sub_100016B04@<X0>(void *a1@<X8>)
{
  return sub_100014CB4((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_100016B10()
{
  swift_release();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100016B58@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100014C08(a1, v2 + 16, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 48), (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10001221C, a2);
}

void *sub_100016B8C@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v4);
  *a1 = v4;
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration()
{
  return &type metadata for FeatureGeneration;
}

unsigned char *storeEnumTagSinglePayload for FeatureGeneration.ValueStrategy(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100016C78);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration.ValueStrategy()
{
  return &type metadata for FeatureGeneration.ValueStrategy;
}

uint64_t sub_100016CB4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FeatureGeneration.GenerationError(uint64_t a1)
{
  return sub_10000CFD4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s35com_apple_dt_DTMLModelRunnerService17FeatureGenerationV15GenerationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100016CB4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FeatureGeneration.GenerationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100016CB4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000CFD4(v6, v7, v8);
  return a1;
}

__n128 _s14ModelStructureOwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FeatureGeneration.GenerationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000CFD4(v4, v5, v6);
  return a1;
}

uint64_t _s14ModelStructureOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14ModelStructureOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100016E68(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100016E70(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration.GenerationError()
{
  return &type metadata for FeatureGeneration.GenerationError;
}

unint64_t sub_100016E8C()
{
  unint64_t result = qword_10003CF48;
  if (!qword_10003CF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF48);
  }
  return result;
}

unint64_t sub_100016F40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008BE0(&qword_10003D018);
  uint64_t v2 = (void *)sub_10002C790();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000173E0(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v9 = (uint64_t *)(v2[6] + 16 * result);
    *id v9 = v5;
    v9[1] = v6;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100017040(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008BE0(&qword_10003CFE8);
  uint64_t v2 = sub_10002C790();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001D450(v6, (uint64_t)v15, &qword_10003CFF0);
    unint64_t result = sub_1000174DC((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000165B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100017184(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008BE0(&qword_10003CFD0);
  uint64_t v2 = sub_10002C790();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001D450(v6, (uint64_t)&v13, &qword_10003CFD8);
    uint64_t v7 = v13;
    unint64_t result = sub_100017458(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000165B4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000172B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008BE0(&qword_10003D008);
  uint64_t v2 = (void *)sub_10002C790();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001D450(v4, (uint64_t)v13, &qword_10003D010);
    unint64_t result = sub_1000174DC((uint64_t)v13);
    if (v6) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v7 = v2[6] + 40 * result;
    long long v8 = v13[0];
    long long v9 = v13[1];
    *(void *)(v7 + 32) = v14;
    *(_OWORD *)uint64_t v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    *(void *)(v2[7] + 8 * result) = v15;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 48;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000173E0(uint64_t a1, uint64_t a2)
{
  sub_10002C970();
  sub_10002C4E0();
  Swift::Int v4 = sub_10002C990();
  return sub_10001758C(a1, a2, v4);
}

unint64_t sub_100017458(uint64_t a1)
{
  sub_10002C970();
  type metadata accessor for CFString(0);
  sub_10001D348();
  sub_10002C080();
  Swift::Int v2 = sub_10002C990();
  return sub_100017670(a1, v2);
}

unint64_t sub_1000174DC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10002C670(*(void *)(v2 + 40));
  return sub_10001779C(a1, v4);
}

unint64_t sub_100017520(unsigned __int8 a1)
{
  sub_10002C970();
  sub_10002C980(a1);
  Swift::Int v2 = sub_10002C990();
  return sub_100017864(a1, v2);
}

unint64_t sub_10001758C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10002C900() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10002C900() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100017670(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10001D348();
    id v7 = v6;
    char v8 = sub_10002C070();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_10002C070();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_10001779C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001D3A0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10002C680();
      sub_10001D3FC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100017864(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100017904(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017A64(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017924(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017BF0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017944(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017D6C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017964(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000185BC(a1, a2, a3, *v3, &qword_10003CFC8);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017994(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018028(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000179B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018178(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000179D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000182D8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000179F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018444(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017A14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000185BC(a1, a2, a3, *v3, &qword_10003CFB0);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017A44(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001872C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100017A64(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CF70);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[72 * v8]) {
      memmove(v12, v13, 72 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[72 * v8] || v12 >= &v13[72 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100017BF0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CF78);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100017D6C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CF68);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100017EBC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CAE8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100018028(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CFF8);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100018178(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003D000);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_1000182D8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CFA0);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_100018444(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CFA8);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 80 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_1000185BC(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_100008BE0(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    size_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  size_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v9] || v14 >= &v15[16 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_10001872C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008BE0(&qword_10003CF90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10002C7A0();
  __break(1u);
  return result;
}

uint64_t sub_1000188B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008BE0(&qword_10003CFC0);
  char v36 = a2;
  uint64_t v6 = sub_10002C780();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v23 = v22 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_38;
        }
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v2;
          if (v36)
          {
            uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
            if (v35 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *uint64_t v9 = -1 << v35;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v25 = v9[v15];
        if (!v25)
        {
          int64_t v26 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v25 = v9[v26];
          if (!v25)
          {
            while (1)
            {
              int64_t v15 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_31;
              }
              unint64_t v25 = v9[v15];
              ++v26;
              if (v25) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        unint64_t v11 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      uint64_t v27 = 16 * v23;
      char v28 = (uint64_t *)(*(void *)(v5 + 48) + v27);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v27);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_10002C970();
      sub_10002C4E0();
      uint64_t result = sub_10002C990();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v33 = v18 == v32;
          if (v18 == v32) {
            unint64_t v18 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        unint64_t v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 16 * v19;
      uint64_t v21 = (void *)(*(void *)(v7 + 48) + v20);
      void *v21 = v30;
      v21[1] = v29;
      *(_OWORD *)(*(void *)(v7 + 56) + v20) = v37;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100018BA0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008BE0(&qword_10003CFB8);
  char v38 = a2;
  uint64_t v6 = sub_10002C780();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10002C970();
    sub_10002C4E0();
    uint64_t result = sub_10002C990();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100018EB0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008BE0(&qword_10003CF60);
  uint64_t result = sub_10002C780();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    int64_t v8 = 0;
    uint64_t v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v33) {
          goto LABEL_31;
        }
        unint64_t v18 = v34[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v33) {
            goto LABEL_31;
          }
          unint64_t v18 = v34[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v33)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v34 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v33) {
                  goto LABEL_31;
                }
                unint64_t v18 = v34[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(v5 + 56) + 16 * v16;
      Swift::UInt v21 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v16);
      char v22 = *(unsigned char *)(v20 + 8);
      uint64_t v23 = *(void *)v20;
      sub_10002C970();
      sub_10002C980(v21);
      uint64_t result = sub_10002C990();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v7 + 48) + v13) = v21;
      uint64_t v14 = *(void *)(v7 + 56) + 16 * v13;
      *(void *)uint64_t v14 = v23;
      *(unsigned char *)(v14 + 8) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v3 = v7;
  return result;
}

void *sub_10001918C()
{
  uint64_t v1 = v0;
  sub_100008BE0(&qword_10003CFC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002C770();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    Swift::UInt v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

id sub_100019338()
{
  uint64_t v1 = v0;
  sub_100008BE0(&qword_10003CFB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002C770();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    long long v20 = *(void **)(*(void *)(v2 + 56) + v19);
    Swift::UInt v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000194EC()
{
  uint64_t v1 = v0;
  sub_100008BE0(&qword_10003CF60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002C770();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v22 = __clz(__rbit64(v20));
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = v22 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 16 * v15;
    uint64_t v17 = *(void *)v16;
    LOBYTE(v16) = *(unsigned char *)(v16 + 8);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v18 = *(void *)(v4 + 56) + 16 * v15;
    *(void *)uint64_t v18 = v17;
    *(unsigned char *)(v18 + 8) = v16;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001968C(uint64_t a1)
{
  uint64_t v42 = sub_10002C320();
  uint64_t v2 = *(void *)(v42 - 8);
  uint64_t v3 = __chkstk_darwin(v42);
  uint64_t v40 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v39 = (char *)&v32 - v5;
  sub_100008BE0(&qword_10003CF98);
  uint64_t result = sub_10002C770();
  int64_t v7 = 0;
  uint64_t v43 = a1;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = a1 + 64;
  uint64_t v8 = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v9 - 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v8;
  uint64_t v33 = v9;
  int64_t v34 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v41 = v2;
  uint64_t v36 = v2 + 8;
  uint64_t v37 = v2 + 16;
  uint64_t v35 = result + 64;
  uint64_t v38 = result;
  uint64_t v14 = v2;
  uint64_t v16 = v39;
  uint64_t v15 = (uint64_t)v40;
  uint64_t v17 = v42;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v44 = (v13 - 1) & v13;
  int64_t v45 = v7;
  for (unint64_t i = __clz(__rbit64(v13)) | (v7 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v21 << 6))
  {
    uint64_t v23 = *(void *)(v43 + 56);
    int64_t v24 = (uint64_t *)(*(void *)(v43 + 48) + 16 * i);
    uint64_t v25 = v24[1];
    uint64_t v46 = *v24;
    unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v26(v16, v23 + *(void *)(v14 + 72) * i, v17);
    v26((char *)v15, (unint64_t)v16, v17);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_10001AB5C(v15);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
    *(void *)(v35 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t result = v38;
    unint64_t v28 = (void *)(*(void *)(v38 + 48) + 16 * i);
    void *v28 = v46;
    v28[1] = v25;
    *(void *)(*(void *)(result + 56) + 8 * i) = v27;
    uint64_t v29 = *(void *)(result + 16);
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    *(void *)(result + 16) = v31;
    unint64_t v13 = v44;
    int64_t v7 = v45;
    if (v44) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v19 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_24;
    }
    if (v19 >= v34) {
      return result;
    }
    unint64_t v20 = *(void *)(v33 + 8 * v19);
    int64_t v21 = v7 + 1;
    if (!v20)
    {
      int64_t v21 = v7 + 2;
      if (v7 + 2 >= v34) {
        return result;
      }
      unint64_t v20 = *(void *)(v33 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v7 + 3;
        if (v7 + 3 >= v34) {
          return result;
        }
        unint64_t v20 = *(void *)(v33 + 8 * v21);
        if (!v20) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v44 = (v20 - 1) & v20;
    int64_t v45 = v21;
  }
  uint64_t v22 = v7 + 4;
  if (v7 + 4 >= v34) {
    return result;
  }
  unint64_t v20 = *(void *)(v33 + 8 * v22);
  if (v20)
  {
    int64_t v21 = v7 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v21 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v21 >= v34) {
      return result;
    }
    unint64_t v20 = *(void *)(v33 + 8 * v21);
    ++v22;
    if (v20) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_1000199B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100008BE0(&qword_10003CF60);
    uint64_t v3 = (void *)sub_10002C790();
    for (unint64_t i = (unsigned char *)(a1 + 48); ; i += 24)
    {
      unsigned __int8 v5 = *(i - 16);
      uint64_t v6 = *((void *)i - 1);
      char v7 = *i;
      unint64_t result = sub_100017520(v5);
      if (v9) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      uint64_t v10 = v3[7] + 16 * result;
      *(void *)uint64_t v10 = v6;
      *(unsigned char *)(v10 + 8) = v7;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_100019A9C(uint64_t a1)
{
  uint64_t v102 = sub_10002C110();
  uint64_t v120 = *(void *)(v102 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v101 = (char *)v90 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_10002C130();
  v94 = *(void (***)(char *, uint64_t))(v99 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v98 = (char *)v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008BE0(&qword_10003CF58);
  ((void (*)(void))__chkstk_darwin)();
  unsigned __int8 v5 = (char *)v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002C0E0();
  unint64_t v96 = *(void (***)(char *, uint64_t))(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v112 = (char *)v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v119 = (char *)v90 - v10;
  __chkstk_darwin(v9);
  v125 = (char *)v90 - v11;
  uint64_t v12 = sub_10002C210();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v111 = (char *)v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v117 = (char *)v90 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v20 = (char *)v90 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)v90 - v22;
  __chkstk_darwin(v21);
  v122 = (char *)v90 - v24;
  uint64_t v25 = sub_10002C150();
  int64_t v26 = *(void *)(v25 + 16);
  v115 = v5;
  uint64_t v116 = a1;
  uint64_t v114 = v6;
  uint64_t v126 = v12;
  uint64_t v118 = v13;
  if (v26)
  {
    v130 = &_swiftEmptyArrayStorage;
    sub_100017944(0, v26, 0);
    unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v27 = v13 + 16;
    uint64_t v29 = *(unsigned __int8 *)(v27 + 64);
    v121 = (void (**)(char *, uint64_t))v25;
    uint64_t v30 = v25 + ((v29 + 32) & ~v29);
    v128 = *(void (**)(char *, uint64_t))(v27 + 56);
    v129 = v28;
    v127 = (uint64_t (**)(char *, uint64_t))(v27 + 72);
    int v31 = enum case for MLComputeDevice.cpu(_:);
    LODWORD(v124) = enum case for MLComputeDevice.gpu(_:);
    LODWORD(v123) = enum case for MLComputeDevice.neuralEngine(_:);
    uint64_t v32 = (void (**)(char *, uint64_t))(v27 - 8);
    do
    {
      uint64_t v33 = v129;
      v129(v23, (char *)v30, v12);
      v33(v20, v23, v12);
      int v34 = (*v127)(v20, v12);
      if (v34 == v123) {
        char v35 = 2;
      }
      else {
        char v35 = 3;
      }
      if (v34 == v124) {
        char v35 = 1;
      }
      if (v34 == v31) {
        char v36 = 0;
      }
      else {
        char v36 = v35;
      }
      uint64_t v37 = *v32;
      (*v32)(v20, v12);
      v37(v23, v12);
      uint64_t v38 = v130;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        BOOL v39 = v38;
      }
      else
      {
        sub_100017944(0, v38[2] + 1, 1);
        BOOL v39 = v130;
      }
      unint64_t v41 = v39[2];
      unint64_t v40 = v39[3];
      if (v41 >= v40 >> 1)
      {
        int v113 = v31;
        sub_100017944(v40 > 1, v41 + 1, 1);
        int v31 = v113;
        BOOL v39 = v130;
      }
      v39[2] = v41 + 1;
      *((unsigned char *)v39 + v41 + 32) = v36;
      v30 += (uint64_t)v128;
      --v26;
      uint64_t v12 = v126;
    }
    while (v26);
    v90[0] = v39;
    swift_bridgeObjectRelease();
    int v42 = v31;
    unsigned __int8 v5 = v115;
    a1 = v116;
    uint64_t v6 = v114;
  }
  else
  {
    swift_bridgeObjectRelease();
    int v42 = enum case for MLComputeDevice.cpu(_:);
    v90[0] = &_swiftEmptyArrayStorage;
  }
  uint64_t v43 = v122;
  sub_10002C140();
  uint64_t v44 = v118;
  int64_t v45 = *(uint64_t (**)(char *, uint64_t))(v118 + 88);
  uint64_t v110 = v118 + 88;
  v109 = v45;
  int v46 = v45(v43, v12);
  int v113 = v42;
  uint64_t v47 = v117;
  if (v46 == v42)
  {
    int v91 = 0;
  }
  else
  {
    if (v46 == enum case for MLComputeDevice.gpu(_:))
    {
      int v48 = 1;
    }
    else if (v46 == enum case for MLComputeDevice.neuralEngine(_:))
    {
      int v48 = 2;
    }
    else
    {
      int v48 = 3;
    }
    int v91 = v48;
  }
  v128 = *(void (**)(char *, uint64_t))(v44 + 8);
  v129 = (void (*)(char *, char *, uint64_t))(v44 + 8);
  v128(v43, v12);
  char v49 = (void *)sub_1000199B8((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v50 = sub_10002C200();
  uint64_t v51 = *(void *)(v50 + 16);
  v90[1] = v50;
  if (!v51)
  {
LABEL_57:
    uint64_t v88 = sub_10002C160();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v88 - 8) + 8))(a1, v88);
    swift_bridgeObjectRelease();
    return v90[0];
  }
  uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v53 = v44 + 16;
  uint64_t v52 = v54;
  unint64_t v55 = v50 + ((*(unsigned __int8 *)(v53 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 64));
  v124 = (unsigned int (**)(char *, uint64_t, uint64_t))(v96 + 6);
  v108 = (void (**)(char *, char *, uint64_t))(v96 + 4);
  int v107 = enum case for MLComputeDevice.gpu(_:);
  int v106 = enum case for MLComputeDevice.neuralEngine(_:);
  Swift::Int v105 = (void (**)(char *, char *, uint64_t))(v96 + 2);
  v104 = (uint64_t (**)(char *, uint64_t))(v96 + 11);
  int v103 = enum case for MLComputePlan.DeviceUsage.SupportState.unsupported(_:);
  int v97 = enum case for MLComputePlan.DeviceUsage.SupportState.supported(_:);
  unsigned int v93 = enum case for MLComputePlan.DeviceUsage.Reason.Category.unsupported(_:);
  uint64_t v92 = (void (**)(char *, void, uint64_t))(v120 + 104);
  v121 = v96 + 1;
  v100 = (void (**)(char *, uint64_t))(v120 + 8);
  v96 += 12;
  uint64_t v95 = (void (**)(char *, char *, uint64_t))(v94 + 4);
  ++v94;
  v122 = *(char **)(v53 + 56);
  v123 = v54;
  uint64_t v118 = v53;
  while (1)
  {
    unint64_t v56 = v52;
    v52(v47, (char *)v55, v12);
    sub_10002C0F0();
    if ((*v124)(v5, 1, v6) != 1) {
      break;
    }
    v128(v47, v12);
    sub_10001D2EC((uint64_t)v5, &qword_10003CF58);
LABEL_30:
    uint64_t v52 = v123;
    v55 += (unint64_t)v122;
    if (!--v51) {
      goto LABEL_57;
    }
  }
  uint64_t v57 = v125;
  (*v108)(v125, v5, v6);
  uint64_t v58 = v111;
  v56(v111, v47, v12);
  int v59 = v109(v58, v12);
  if (v59 == v106) {
    int v60 = 2;
  }
  else {
    int v60 = 3;
  }
  if (v59 == v107) {
    int v60 = 1;
  }
  if (v59 == v113) {
    int v60 = 0;
  }
  LODWORD(v127) = v60;
  v128(v58, v12);
  uint64_t v61 = *v105;
  uint64_t v62 = v119;
  (*v105)(v119, v57, v6);
  uint64_t v63 = v112;
  v61(v112, v62, v6);
  int v64 = (*v104)(v63, v6);
  if (v64 == v103)
  {
    (*v96)(v63, v6);
    BOOL v65 = v98;
    uint64_t v66 = v63;
    uint64_t v67 = v99;
    (*v95)(v98, v66, v99);
    v68 = v101;
    sub_10002C120();
    uint64_t v120 = sub_10002C100();
    uint64_t v69 = *v121;
    (*v121)(v62, v6);
    (*v100)(v68, v102);
    uint64_t v70 = v65;
    uint64_t v12 = v126;
    (*v94)(v70, v67);
  }
  else
  {
    if (v64 == v97)
    {
      uint64_t v69 = *v121;
      (*v121)(v119, v6);
      uint64_t v120 = 0;
      char v71 = 1;
      goto LABEL_45;
    }
    BOOL v72 = v101;
    uint64_t v73 = v102;
    (*v92)(v101, v93, v102);
    uint64_t v120 = sub_10002C100();
    uint64_t v69 = *v121;
    (*v121)(v119, v6);
    (*v100)(v72, v73);
    v69(v63, v6);
  }
  char v71 = 0;
LABEL_45:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v130 = v49;
  unint64_t v76 = sub_100017520(v127);
  uint64_t v77 = v49[2];
  BOOL v78 = (v75 & 1) == 0;
  uint64_t v79 = v77 + v78;
  if (!__OFADD__(v77, v78))
  {
    char v80 = v75;
    if (v49[3] < v79)
    {
      sub_100018EB0(v79, isUniquelyReferenced_nonNull_native);
      unint64_t v81 = sub_100017520(v127);
      if ((v80 & 1) != (v82 & 1)) {
        goto LABEL_60;
      }
      unint64_t v76 = v81;
      char v49 = v130;
      if ((v80 & 1) == 0) {
        goto LABEL_54;
      }
LABEL_52:
      uint64_t v83 = v49[7] + 16 * v76;
      *(void *)uint64_t v83 = v120;
      *(unsigned char *)(v83 + 8) = v71;
LABEL_56:
      swift_bridgeObjectRelease();
      uint64_t v6 = v114;
      v69(v125, v114);
      uint64_t v47 = v117;
      v128(v117, v12);
      unsigned __int8 v5 = v115;
      a1 = v116;
      goto LABEL_30;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      char v49 = v130;
      if (v75) {
        goto LABEL_52;
      }
    }
    else
    {
      sub_1000194EC();
      char v49 = v130;
      if (v80) {
        goto LABEL_52;
      }
    }
LABEL_54:
    v49[(v76 >> 6) + 8] |= 1 << v76;
    *(unsigned char *)(v49[6] + v76) = (_BYTE)v127;
    uint64_t v84 = v49[7] + 16 * v76;
    *(void *)uint64_t v84 = v120;
    *(unsigned char *)(v84 + 8) = v71;
    uint64_t v85 = v49[2];
    BOOL v86 = __OFADD__(v85, 1);
    uint64_t v87 = v85 + 1;
    if (v86) {
      goto LABEL_59;
    }
    v49[2] = v87;
    goto LABEL_56;
  }
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  uint64_t result = sub_10002C910();
  __break(1u);
  return result;
}

void *sub_10001A708(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100008BE0(&qword_10003CF50);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10002C160();
  uint64_t v8 = *(void *)(v57 - 8);
  uint64_t v9 = __chkstk_darwin(v57);
  uint64_t v47 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  int v46 = (char *)v42 - v11;
  uint64_t v56 = sub_10002C260();
  uint64_t v12 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = &_swiftEmptyArrayStorage;
  if (v15)
  {
    v42[1] = v2;
    int v64 = &_swiftEmptyArrayStorage;
    sub_100017904(0, v15, 0);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v18 = v12 + 16;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v51 = *(void *)(v18 + 56);
    uint64_t v52 = v17;
    uint64_t v44 = (void (**)(char *, char *, uint64_t))(v8 + 16);
    int64_t v45 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v53 = v18;
    uint64_t v54 = v7;
    char v49 = (void (**)(char *, uint64_t))(v18 - 8);
    uint64_t v50 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v43 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v55 = a2;
    do
    {
      uint64_t v20 = v56;
      v52(v14, v19, v56);
      swift_retain();
      uint64_t v21 = sub_10002C240();
      uint64_t v62 = v22;
      uint64_t v63 = v21;
      uint64_t v23 = sub_10002C250();
      uint64_t v60 = v24;
      uint64_t v61 = v23;
      uint64_t v59 = sub_10002C220();
      uint64_t v58 = sub_10002C230();
      sub_10002C170();
      uint64_t v25 = v57;
      if ((*v50)(v7, 1, v57) == 1)
      {
        swift_release();
        (*v49)(v14, v20);
        sub_10001D2EC((uint64_t)v7, &qword_10003CF50);
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        uint64_t v28 = 0;
      }
      else
      {
        uint64_t v29 = v46;
        (*v45)(v46, v7, v25);
        uint64_t v30 = (uint64_t)v47;
        (*v44)(v47, v29, v25);
        uint64_t v26 = sub_100019A9C(v30);
        uint64_t v48 = v31;
        uint64_t v33 = v32;
        swift_release();
        uint64_t v34 = v20;
        uint64_t v28 = v33;
        (*v49)(v14, v34);
        (*v43)(v29, v25);
        uint64_t v27 = v48;
      }
      uint64_t v16 = v64;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100017904(0, v16[2] + 1, 1);
        uint64_t v16 = v64;
      }
      unint64_t v36 = v16[2];
      unint64_t v35 = v16[3];
      if (v36 >= v35 >> 1)
      {
        sub_100017904(v35 > 1, v36 + 1, 1);
        uint64_t v16 = v64;
      }
      v16[2] = v36 + 1;
      uint64_t v37 = &v16[9 * v36];
      uint64_t v38 = v62;
      v37[4] = v63;
      v37[5] = v38;
      uint64_t v39 = v60;
      v37[6] = v61;
      v37[7] = v39;
      uint64_t v40 = v58;
      v37[8] = v59;
      v37[9] = v40;
      v37[10] = v26;
      v37[11] = v27;
      v37[12] = v28;
      v19 += v51;
      --v15;
      uint64_t v7 = v54;
    }
    while (v15);
  }
  return v16;
}

uint64_t sub_10001AB5C(uint64_t a1)
{
  uint64_t v2 = sub_10002C300();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (uint64_t *)((char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_10002C310();
  int64_t v10 = *(void *)(v9 + 16);
  uint64_t v11 = &_swiftEmptyArrayStorage;
  if (!v10)
  {
LABEL_13:
    uint64_t v24 = sub_10002C320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a1, v24);
    swift_bridgeObjectRelease();
    return (uint64_t)v11;
  }
  uint64_t v27 = a1;
  uint64_t v37 = &_swiftEmptyArrayStorage;
  sub_1000179D4(0, v10, 0);
  uint64_t v13 = *(void (**)(void, void, void))(v3 + 16);
  uint64_t v12 = v3 + 16;
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64);
  uint64_t v26 = v9;
  unint64_t v15 = v9 + v14;
  uint64_t v34 = *(void *)(v12 + 56);
  unint64_t v35 = (void (*)(uint64_t *, char *, uint64_t))v13;
  uint64_t v33 = (uint64_t (**)(uint64_t *, uint64_t))(v12 + 72);
  int v32 = enum case for MLModelStructure.Program.Binding.value(_:);
  int v29 = enum case for MLModelStructure.Program.Binding.name(_:);
  uint64_t v28 = (void (**)(uint64_t *, uint64_t))(v12 + 80);
  uint64_t v31 = (void (**)(uint64_t *, uint64_t))(v12 - 8);
  uint64_t v30 = (v12 - 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v36 = v12;
  while (1)
  {
    uint64_t v16 = v35;
    v35((uint64_t *)v8, (char *)v15, v2);
    v16(v6, v8, v2);
    int v17 = (*v33)(v6, v2);
    if (v17 != v32) {
      break;
    }
    uint64_t v18 = *v31;
    (*v31)(v6, v2);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
LABEL_7:
    v18((uint64_t *)v8, v2);
    uint64_t v11 = v37;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1000179D4(0, v11[2] + 1, 1);
      uint64_t v11 = v37;
    }
    unint64_t v22 = v11[2];
    unint64_t v21 = v11[3];
    if (v22 >= v21 >> 1)
    {
      sub_1000179D4(v21 > 1, v22 + 1, 1);
      uint64_t v11 = v37;
    }
    void v11[2] = v22 + 1;
    uint64_t v23 = (char *)&v11[2 * v22];
    *((void *)v23 + 4) = v19;
    *((void *)v23 + 5) = v20;
    v15 += v34;
    if (!--v10)
    {
      a1 = v27;
      goto LABEL_13;
    }
  }
  if (v17 == v29)
  {
    (*v28)(v6, v2);
    uint64_t v19 = *v6;
    uint64_t v20 = v6[1];
    uint64_t v18 = *v31;
    goto LABEL_7;
  }
  uint64_t result = sub_10002C8F0();
  __break(1u);
  return result;
}

unint64_t *sub_10001AE78(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = a2;
  uint64_t v28 = sub_10002C2F0();
  uint64_t v4 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v26 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v23 = v2;
    int v29 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100017A44(0, v6, 0);
    uint64_t v7 = v29;
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v8 = v4 + 16;
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v24 = *(void *)(v8 + 56);
    uint64_t v25 = v9;
    do
    {
      uint64_t v11 = v26;
      uint64_t v12 = v8;
      v25(v26, v10, v28);
      uint64_t v13 = v27;
      swift_retain();
      uint64_t v14 = sub_10001BA48(v11, v13);
      unint64_t v16 = v15;
      unint64_t v18 = v17;
      swift_release();
      int v29 = v7;
      unint64_t v20 = v7[2];
      unint64_t v19 = v7[3];
      if (v20 >= v19 >> 1)
      {
        sub_100017A44(v19 > 1, v20 + 1, 1);
        uint64_t v7 = v29;
      }
      v7[2] = v20 + 1;
      unint64_t v21 = &v7[3 * v20];
      v21[4] = v14;
      v21[5] = v16;
      v21[6] = v18;
      v10 += v24;
      --v6;
      uint64_t v8 = v12;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_10001B048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v5 = sub_100008BE0(&qword_10003CF88);
  __chkstk_darwin(v5 - 8);
  unint64_t v89 = (char *)v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002C1C0();
  uint64_t v90 = *(void *)(v7 - 8);
  uint64_t v91 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  char v82 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v83 = (char *)v77 - v10;
  uint64_t v102 = sub_10002C3B0();
  uint64_t v11 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  unint64_t v101 = (char *)v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_10002C2B0();
  uint64_t v13 = *(void *)(v100 - 8);
  uint64_t v14 = __chkstk_darwin(v100);
  uint64_t v99 = (char *)v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v98 = (char *)v77 - v16;
  uint64_t v17 = sub_100008BE0(&qword_10003CF50);
  __chkstk_darwin(v17 - 8);
  uint64_t v84 = (char *)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002C160();
  uint64_t v85 = *(void *)(v19 - 8);
  uint64_t v20 = __chkstk_darwin(v19);
  char v80 = (char *)v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  unint64_t v81 = (char *)v77 - v22;
  uint64_t v23 = sub_10002C360();
  uint64_t v87 = v24;
  uint64_t v88 = v23;
  uint64_t v25 = sub_10002C380();
  uint64_t v86 = sub_10001968C(v25);
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_10002C390();
  int64_t v27 = *(void *)(v26 + 16);
  uint64_t v93 = a1;
  if (v27)
  {
    v77[2] = 0;
    uint64_t v78 = v19;
    uint64_t v79 = a3;
    int v103 = &_swiftEmptyArrayStorage;
    sub_100017A14(0, v27, 0);
    int v29 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v28 = v13 + 16;
    unint64_t v96 = v29;
    unint64_t v30 = (*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64);
    v77[1] = v26;
    unint64_t v31 = v26 + v30;
    uint64_t v32 = *(void *)(v28 + 56);
    v94 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v95 = v32;
    uint64_t v33 = (void (**)(char *, uint64_t))(v28 - 8);
    uint64_t v97 = v28;
    uint64_t v34 = v98;
    do
    {
      uint64_t v35 = v100;
      uint64_t v36 = v96;
      v96(v34, (char *)v31, v100);
      uint64_t v37 = v99;
      v36(v99, v34, v35);
      uint64_t v38 = sub_10002C290();
      uint64_t v40 = v39;
      unint64_t v41 = v101;
      sub_10002C2A0();
      (*v94)(v41, v102);
      int v42 = *v33;
      (*v33)(v37, v35);
      v42(v34, v35);
      uint64_t v43 = v103;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100017A14(0, v43[2] + 1, 1);
        uint64_t v43 = v103;
      }
      unint64_t v45 = v43[2];
      unint64_t v44 = v43[3];
      if (v45 >= v44 >> 1)
      {
        sub_100017A14(v44 > 1, v45 + 1, 1);
        uint64_t v43 = v103;
      }
      v43[2] = v45 + 1;
      int v46 = (char *)&v43[2 * v45];
      *((void *)v46 + 4) = v38;
      *((void *)v46 + 5) = v40;
      v31 += v95;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease();
    a3 = v79;
    a1 = v93;
    uint64_t v19 = v78;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = &_swiftEmptyArrayStorage;
  }
  uint64_t v47 = sub_10002C370();
  uint64_t v48 = v92;
  swift_retain();
  char v49 = sub_10001AE78(v47, v48);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v50 = (uint64_t)v84;
  sub_10002C180();
  uint64_t v51 = v85;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v50, 1, v19) == 1)
  {
    sub_10001D2EC(v50, &qword_10003CF50);
    unint64_t v101 = 0;
    uint64_t v102 = 0;
    uint64_t v52 = 0;
  }
  else
  {
    uint64_t v53 = v81;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v81, v50, v19);
    uint64_t v54 = (uint64_t)v80;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v80, v53, v19);
    uint64_t v55 = sub_100019A9C(v54);
    unint64_t v101 = v56;
    uint64_t v102 = v55;
    LOBYTE(v54) = v57;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v19);
    uint64_t v52 = v54;
  }
  uint64_t v58 = (uint64_t)v89;
  uint64_t v59 = v90;
  sub_10002C190();
  uint64_t v60 = v91;
  int v61 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v58, 1, v91);
  if (v61 == 1)
  {
    swift_release();
    uint64_t v62 = sub_10002C3A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 8))(a1, v62);
    uint64_t result = sub_10001D2EC(v58, &qword_10003CF88);
    uint64_t v64 = 0;
  }
  else
  {
    BOOL v65 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 32);
    uint64_t v100 = v52;
    uint64_t v66 = v83;
    v65(v83, v58, v60);
    uint64_t v67 = v49;
    v68 = v82;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v82, v66, v60);
    sub_10002C1B0();
    uint64_t v64 = v69;
    uint64_t v70 = *(void (**)(char *, uint64_t))(v59 + 8);
    char v71 = v68;
    char v49 = v67;
    v70(v71, v60);
    swift_release();
    uint64_t v72 = sub_10002C3A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8))(v93, v72);
    uint64_t v73 = v66;
    uint64_t v52 = v100;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v70)(v73, v60);
  }
  uint64_t v74 = v87;
  *(void *)a3 = v88;
  *(void *)(a3 + 8) = v74;
  *(void *)(a3 + 16) = v86;
  *(void *)(a3 + 24) = v43;
  uint64_t v75 = v102;
  *(void *)(a3 + 32) = v49;
  *(void *)(a3 + 40) = v75;
  unint64_t v76 = v101;
  *(void *)(a3 + 48) = v52;
  *(void *)(a3 + 56) = v76;
  *(void *)(a3 + 64) = v64;
  *(unsigned char *)(a3 + 72) = v61 == 1;
  return result;
}

unint64_t *sub_10001B880(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = sub_10002C3A0();
  uint64_t v5 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    v21[1] = v2;
    uint64_t v26 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000179F4(0, v8, 0);
    uint64_t v9 = v26;
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v10 = v5 + 16;
    uint64_t v22 = v11;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v13 = *(void *)(v10 + 56);
    do
    {
      v22(v7, v12, v23);
      swift_retain();
      sub_10001B048((uint64_t)v7, a2, (uint64_t)v24);
      uint64_t v26 = v9;
      unint64_t v15 = v9[2];
      unint64_t v14 = v9[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000179F4(v14 > 1, v15 + 1, 1);
        uint64_t v9 = v26;
      }
      v9[2] = v15 + 1;
      uint64_t v16 = &v9[10 * v15];
      *((_OWORD *)v16 + 2) = v24[0];
      long long v17 = v24[1];
      long long v18 = v24[2];
      long long v19 = v25[0];
      *(_OWORD *)((char *)v16 + 89) = *(_OWORD *)((char *)v25 + 9);
      *((_OWORD *)v16 + 4) = v18;
      *((_OWORD *)v16 + 5) = v19;
      *((_OWORD *)v16 + 3) = v17;
      v12 += v13;
      --v8;
    }
    while (v8);
  }
  return v9;
}

void *sub_10001BA48(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = sub_10002C3B0();
  uint64_t v4 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  unint64_t v41 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002C2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v40 = (char *)&v33 - v11;
  uint64_t v12 = sub_10002C2E0();
  int64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v34 = a2;
    uint64_t v35 = a1;
    unint64_t v44 = &_swiftEmptyArrayStorage;
    sub_100017A14(0, v13, 0);
    unint64_t v15 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v14 = v7 + 16;
    uint64_t v16 = *(unsigned __int8 *)(v14 + 64);
    uint64_t v33 = v12;
    uint64_t v17 = v12 + ((v16 + 32) & ~v16);
    uint64_t v37 = *(void *)(v14 + 56);
    uint64_t v38 = v15;
    uint64_t v36 = (void (**)(char *, uint64_t))(v4 + 8);
    long long v18 = (void (**)(char *, uint64_t))(v14 - 8);
    uint64_t v39 = v14;
    do
    {
      long long v19 = v40;
      uint64_t v20 = v38;
      v38(v40, (char *)v17, v6);
      v20(v10, v19, v6);
      uint64_t v21 = sub_10002C290();
      uint64_t v43 = v22;
      uint64_t v23 = v41;
      sub_10002C2A0();
      (*v36)(v23, v42);
      uint64_t v24 = *v18;
      (*v18)(v10, v6);
      v24(v19, v6);
      uint64_t v25 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100017A14(0, v25[2] + 1, 1);
        uint64_t v25 = v44;
      }
      unint64_t v27 = v25[2];
      unint64_t v26 = v25[3];
      if (v27 >= v26 >> 1)
      {
        sub_100017A14(v26 > 1, v27 + 1, 1);
        uint64_t v25 = v44;
      }
      _OWORD v25[2] = v27 + 1;
      uint64_t v28 = (char *)&v25[2 * v27];
      uint64_t v29 = v43;
      *((void *)v28 + 4) = v21;
      *((void *)v28 + 5) = v29;
      v17 += v37;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    a2 = v34;
    a1 = v35;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = &_swiftEmptyArrayStorage;
  }
  sub_10002C2D0();
  uint64_t v30 = sub_10002C2C0();
  swift_retain();
  sub_10001B880(v30, a2);
  swift_release();
  uint64_t v31 = sub_10002C2F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(a1, v31);
  swift_bridgeObjectRelease();
  return v25;
}

void *sub_10001BDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = sub_10002C3B0();
  uint64_t v4 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v45 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_10002C2B0();
  uint64_t v6 = *(void *)(v44 - 8);
  uint64_t v7 = __chkstk_darwin(v44);
  uint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v43 = (char *)v35 - v10;
  uint64_t v11 = sub_10002C2F0();
  __chkstk_darwin(v11 - 8);
  int64_t v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10002C340();
  int64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v36 = v13;
    uint64_t v37 = a2;
    uint64_t v38 = a1;
    uint64_t v47 = &_swiftEmptyArrayStorage;
    sub_100017A14(0, v15, 0);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    uint64_t v16 = v6 + 16;
    uint64_t v18 = *(unsigned __int8 *)(v16 + 64);
    v35[1] = v14;
    uint64_t v19 = v14 + ((v18 + 32) & ~v18);
    uint64_t v40 = *(void *)(v16 + 56);
    unint64_t v41 = v17;
    uint64_t v39 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v20 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v42 = v16;
    do
    {
      uint64_t v22 = v43;
      uint64_t v21 = v44;
      uint64_t v23 = v41;
      v41(v43, (char *)v19, v44);
      v23(v9, v22, v21);
      uint64_t v24 = sub_10002C290();
      uint64_t v26 = v25;
      unint64_t v27 = v45;
      sub_10002C2A0();
      (*v39)(v27, v46);
      uint64_t v28 = *v20;
      (*v20)(v9, v21);
      v28(v22, v21);
      uint64_t v29 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100017A14(0, v29[2] + 1, 1);
        uint64_t v29 = v47;
      }
      unint64_t v31 = v29[2];
      unint64_t v30 = v29[3];
      if (v31 >= v30 >> 1)
      {
        sub_100017A14(v30 > 1, v31 + 1, 1);
        uint64_t v29 = v47;
      }
      v29[2] = v31 + 1;
      uint64_t v32 = (char *)&v29[2 * v31];
      *((void *)v32 + 4) = v24;
      *((void *)v32 + 5) = v26;
      v19 += v40;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    a2 = v37;
    a1 = v38;
    int64_t v13 = v36;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = &_swiftEmptyArrayStorage;
  }
  sub_10002C330();
  sub_10001BA48((uint64_t)v13, a2);
  uint64_t v33 = sub_10002C350();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(a1, v33);
  return v29;
}

uint64_t sub_10001C194(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = a2;
  uint64_t v51 = sub_10002C350();
  uint64_t v3 = *(void *)(v51 - 8);
  uint64_t v4 = __chkstk_darwin(v51);
  char v49 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v48 = (char *)&v41 - v6;
  sub_100008BE0(&qword_10003CF80);
  uint64_t result = sub_10002C770();
  int64_t v8 = 0;
  uint64_t v52 = a1;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = a1 + 64;
  uint64_t v9 = v11;
  uint64_t v12 = 1 << *(unsigned char *)(v10 - 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v9;
  uint64_t v42 = v10;
  int64_t v43 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v50 = v3;
  uint64_t v45 = v3 + 8;
  uint64_t v46 = v3 + 16;
  uint64_t v44 = result + 64;
  uint64_t v47 = result;
  uint64_t v15 = v3;
  uint64_t v16 = v48;
  uint64_t v17 = v51;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v54 = (v14 - 1) & v14;
  int64_t v55 = v8;
  for (unint64_t i = __clz(__rbit64(v14)) | (v8 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v21 << 6))
  {
    uint64_t v57 = 16 * i;
    uint64_t v23 = *(void *)(v52 + 56);
    uint64_t v24 = (uint64_t *)(*(void *)(v52 + 48) + 16 * i);
    uint64_t v25 = v24[1];
    uint64_t v58 = *v24;
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    v26(v16, v23 + *(void *)(v15 + 72) * i, v17);
    uint64_t v27 = (uint64_t)v49;
    v26(v49, (unint64_t)v16, v17);
    swift_bridgeObjectRetain();
    uint64_t v28 = v53;
    swift_retain();
    uint64_t v29 = sub_10001BDD4(v27, v28);
    uint64_t v56 = v30;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
    *(void *)(v44 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t result = v47;
    uint64_t v35 = (void *)(*(void *)(v47 + 48) + v57);
    void *v35 = v58;
    v35[1] = v25;
    uint64_t v36 = (void *)(*(void *)(result + 56) + 32 * i);
    uint64_t v37 = v56;
    *uint64_t v36 = v29;
    v36[1] = v37;
    v36[2] = v32;
    v36[3] = v34;
    uint64_t v38 = *(void *)(result + 16);
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    *(void *)(result + 16) = v40;
    unint64_t v14 = v54;
    int64_t v8 = v55;
    if (v54) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v19 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_24;
    }
    if (v19 >= v43) {
      return result;
    }
    unint64_t v20 = *(void *)(v42 + 8 * v19);
    int64_t v21 = v8 + 1;
    if (!v20)
    {
      int64_t v21 = v8 + 2;
      if (v8 + 2 >= v43) {
        return result;
      }
      unint64_t v20 = *(void *)(v42 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v8 + 3;
        if (v8 + 3 >= v43) {
          return result;
        }
        unint64_t v20 = *(void *)(v42 + 8 * v21);
        if (!v20) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v54 = (v20 - 1) & v20;
    int64_t v55 = v21;
  }
  uint64_t v22 = v8 + 4;
  if (v8 + 4 >= v43) {
    return result;
  }
  unint64_t v20 = *(void *)(v42 + 8 * v22);
  if (v20)
  {
    int64_t v21 = v8 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v21 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v21 >= v43) {
      return result;
    }
    unint64_t v20 = *(void *)(v42 + 8 * v21);
    ++v22;
    if (v20) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10001C500(uint64_t a1, uint64_t a2)
{
  uint64_t v80 = a2;
  uint64_t v71 = sub_10002C3D0();
  uint64_t v3 = *(void *)(v71 - 8);
  uint64_t v4 = __chkstk_darwin(v71);
  uint64_t v70 = &v56[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v69 = &v56[-v6];
  uint64_t v68 = sub_10002C400();
  uint64_t v7 = *(void *)(v68 - 8);
  uint64_t v8 = __chkstk_darwin(v68);
  uint64_t v62 = &v56[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  int v61 = &v56[-v10];
  uint64_t v78 = sub_10002C280();
  uint64_t v11 = *(void *)(v78 - 8);
  uint64_t v12 = __chkstk_darwin(v78);
  uint64_t v77 = &v56[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  unint64_t v76 = &v56[-v14];
  uint64_t v88 = sub_10002C410();
  uint64_t v15 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v86 = &v56[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = &_swiftEmptyArrayStorage;
  if (!v17) {
    return (uint64_t)v18;
  }
  uint64_t v91 = &_swiftEmptyArrayStorage;
  sub_100017924(0, v17, 0);
  unint64_t v20 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v19 = v15 + 16;
  uint64_t v21 = a1 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
  uint64_t v83 = *(void *)(v19 + 56);
  uint64_t v84 = v20;
  char v82 = (uint64_t (**)(unsigned char *, uint64_t))(v19 + 72);
  int v81 = enum case for MLModelStructure.neuralNetwork(_:);
  int v75 = enum case for MLModelStructure.program(_:);
  int v67 = enum case for MLModelStructure.pipeline(_:);
  uint64_t v79 = (void (**)(unsigned char *, uint64_t))(v19 + 80);
  uint64_t v60 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
  uint64_t v59 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  uint64_t v58 = (void (**)(unsigned char *, uint64_t))(v7 + 8);
  uint64_t v66 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32);
  BOOL v65 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16);
  uint64_t v64 = (void (**)(unsigned char *, uint64_t))(v3 + 8);
  int v57 = enum case for MLModelStructure.unsupported(_:);
  uint64_t v73 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
  uint64_t v74 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
  uint64_t v72 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
  uint64_t v85 = v19;
  uint64_t v22 = v86;
  while (1)
  {
    uint64_t v23 = v88;
    v84(v22, v21, v88);
    int v24 = (*v82)(v22, v23);
    if (v24 != v81) {
      break;
    }
    (*v79)(v22, v88);
    uint64_t v25 = v76;
    uint64_t v26 = v78;
    (*v74)(v76, v86, v78);
    uint64_t v27 = v77;
    (*v73)(v77, v25, v26);
    uint64_t v28 = v80;
    swift_retain();
    uint64_t v29 = sub_10002C270();
    swift_retain();
    uint64_t v30 = v87;
    uint64_t v89 = (uint64_t)sub_10001A708(v29, v28);
    uint64_t v87 = v30;
    swift_release();
    uint64_t v31 = *v72;
    (*v72)(v27, v26);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v32 = v25;
    uint64_t v22 = v86;
    v31(v32, v26);
    uint64_t v33 = 0;
    char v34 = 0;
LABEL_11:
    uint64_t v18 = v91;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100017924(0, v18[2] + 1, 1);
      uint64_t v18 = v91;
    }
    unint64_t v53 = v18[2];
    unint64_t v52 = v18[3];
    if (v53 >= v52 >> 1)
    {
      sub_100017924(v52 > 1, v53 + 1, 1);
      uint64_t v18 = v91;
    }
    v18[2] = v53 + 1;
    uint64_t v54 = (char *)&v18[3 * v53];
    *((void *)v54 + 4) = v89;
    *((void *)v54 + 5) = v33;
    v54[48] = v34;
    v21 += v83;
    if (!--v17) {
      return (uint64_t)v18;
    }
  }
  if (v24 == v75)
  {
    (*v79)(v22, v88);
    uint64_t v35 = v69;
    uint64_t v36 = v71;
    (*v66)(v69, v22, v71);
    uint64_t v37 = v70;
    (*v65)(v70, v35, v36);
    uint64_t v38 = v80;
    swift_retain();
    uint64_t v39 = sub_10002C3C0();
    swift_retain();
    uint64_t v40 = v87;
    uint64_t v89 = sub_10001C194(v39, v38);
    uint64_t v87 = v40;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v41 = *v64;
    (*v64)(v37, v36);
    swift_release();
    v41(v35, v36);
    uint64_t v33 = 0;
    char v34 = 1;
    goto LABEL_11;
  }
  if (v24 == v67)
  {
    (*v79)(v22, v88);
    uint64_t v42 = v61;
    uint64_t v43 = v68;
    (*v60)(v61, v22, v68);
    uint64_t v44 = v62;
    (*v59)(v62, v42, v43);
    uint64_t v45 = v80;
    swift_retain();
    uint64_t v89 = sub_10002C3E0();
    uint64_t v46 = sub_10002C3F0();
    uint64_t v63 = v46;
    swift_retain();
    uint64_t v47 = v46;
    uint64_t v48 = v87;
    uint64_t v33 = sub_10001C500(v47, v45, v90);
    uint64_t v87 = v48;
    swift_release();
    char v49 = *v58;
    uint64_t v50 = v44;
    uint64_t v51 = v68;
    (*v58)(v50, v68);
    swift_release();
    swift_bridgeObjectRelease();
    v49(v42, v51);
    char v34 = 2;
    goto LABEL_11;
  }
  if (v24 == v57)
  {
    uint64_t v33 = 0;
    char v34 = 3;
    uint64_t v89 = 1;
    goto LABEL_11;
  }
  uint64_t result = sub_10002C8F0();
  __break(1u);
  return result;
}

uint64_t sub_10001CD18(uint64_t a1)
{
  uint64_t v2 = sub_10002C3D0();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v44 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v45 = (char *)&v41 - v5;
  uint64_t v6 = sub_10002C400();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v41 = (char *)&v41 - v10;
  uint64_t v11 = sub_10002C280();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  int64_t v17 = (char *)&v41 - v16;
  uint64_t v18 = sub_10002C410();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002C1A0();
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v22 == enum case for MLModelStructure.neuralNetwork(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v21, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    swift_retain();
    uint64_t v23 = sub_10002C270();
    swift_retain();
    uint64_t v24 = (uint64_t)sub_10001A708(v23, a1);
    swift_release();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25(v15, v11);
    swift_release();
    swift_bridgeObjectRelease();
    v25(v17, v11);
    return v24;
  }
  if (v22 == enum case for MLModelStructure.program(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    uint64_t v27 = v45;
    uint64_t v26 = v46;
    uint64_t v28 = v21;
    uint64_t v29 = v47;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v45, v28, v47);
    uint64_t v30 = v44;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v44, v27, v29);
    swift_retain();
    uint64_t v31 = sub_10002C3C0();
    swift_retain();
    uint64_t v24 = sub_10001C194(v31, a1);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v26 + 8);
    v32(v30, v29);
    swift_release();
    v32(v27, v29);
    return v24;
  }
  if (v22 == enum case for MLModelStructure.pipeline(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    char v34 = v41;
    uint64_t v33 = v42;
    uint64_t v35 = v43;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v21, v43);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v9, v34, v35);
    swift_retain();
    uint64_t v36 = sub_10002C3E0();
    uint64_t v37 = sub_10002C3F0();
    swift_retain();
    sub_10001C500(v37, a1);
    swift_release();
    uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
    uint64_t v39 = v9;
    uint64_t v24 = v36;
    v38(v39, v35);
    swift_release();
    swift_bridgeObjectRelease();
    v38(v34, v35);
    return v24;
  }
  if (v22 == enum case for MLModelStructure.unsupported(_:)) {
    return 1;
  }
  uint64_t result = sub_10002C8F0();
  __break(1u);
  return result;
}

uint64_t sub_10001D2EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008BE0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10001D348()
{
  unint64_t result = qword_10003CFE0;
  if (!qword_10003CFE0)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFE0);
  }
  return result;
}

uint64_t sub_10001D3A0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001D3FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D450(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008BE0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001D4B4()
{
  uint64_t v31 = sub_10002C030();
  uint64_t v0 = *(void *)(v31 - 8);
  uint64_t v1 = __chkstk_darwin(v31);
  uint64_t v30 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v26 - v3;
  uint64_t v5 = sub_10002BFC0();
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= 3)
  {
    swift_bridgeObjectRelease();
    sub_10002C5F0();
    if (qword_10003C908 != -1) {
      swift_once();
    }
    sub_100008BE0(&qword_10003CA28);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10002D3D0;
    uint64_t v8 = sub_10002C020();
    uint64_t v10 = v9;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_10000A8CC();
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v10;
    sub_10002C0A0();
    swift_bridgeObjectRelease();
    return 0;
  }
  type metadata accessor for ModelLocation();
  sub_10002B4A4((uint64_t)v4);
  uint64_t v12 = sub_10002BFC0();
  uint64_t v13 = *(void *)(v5 + 16);
  if (v13)
  {
    v26[0] = v0;
    v26[1] = v12;
    unint64_t v14 = *(void *)(v12 + 16);
    uint64_t v15 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v28 = (void (**)(char *, char *, uint64_t))(v0 + 32);
    unint64_t v29 = v6 - 1;
    swift_bridgeObjectRetain();
    unint64_t v16 = 0;
    v26[2] = v5;
    uint64_t v27 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v17 = v5 + 40;
    while (1)
    {
      if (v16 >= v14)
      {
        unint64_t v21 = v14;
        if (v29 == v16)
        {
          sub_10002C4D0();
          swift_bridgeObjectRetain();
          v32._countAndFlagsBits = 0x616B6361706C6D2ELL;
          v32._object = (void *)0xEA00000000006567;
          sub_10002C520(v32);
          uint64_t v15 = v27;
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        uint64_t v18 = v30;
        sub_10002C000();
        swift_bridgeObjectRelease();
        uint64_t v19 = *v15;
        uint64_t v20 = v31;
        (*v15)(v4, v31);
        (*v28)(v4, v18, v20);
        unint64_t v14 = v21;
        if ((sub_10001DCB8() & 1) == 0) {
          break;
        }
      }
      ++v16;
      v17 += 16;
      if (v13 == v16)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v0 = v26[0];
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_10002C5F0();
    if (qword_10003C908 != -1) {
      swift_once();
    }
    sub_100008BE0(&qword_10003CA28);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_10002D3D0;
    uint64_t v23 = sub_10002C020();
    uint64_t v25 = v24;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_10000A8CC();
    *(void *)(v22 + 32) = v23;
    *(void *)(v22 + 40) = v25;
    sub_10002C0A0();
    swift_bridgeObjectRelease();
    v19(v4, v31);
    return 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_16:
  (*(void (**)(char *, uint64_t))(v0 + 8))(v4, v31);
  return 1;
}

uint64_t sub_10001D900()
{
  uint64_t v0 = sub_100008BE0(&qword_10003D020);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10002C030();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002BFB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_10001DCB8() & 1) == 0) {
    return 0;
  }
  uint64_t v29 = v4;
  id v11 = [self defaultManager];
  sub_100008BE0(&qword_10003D028);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10002E5B0;
  *(void *)(v12 + 32) = NSURLIsRegularFileKey;
  *(void *)(v12 + 40) = NSURLIsDirectoryKey;
  uint64_t v13 = NSURLIsRegularFileKey;
  unint64_t v14 = NSURLIsDirectoryKey;
  uint64_t v15 = (void *)sub_10002C5D0();
  swift_bridgeObjectRelease();
  if (!v15)
  {

    return 0;
  }
  id v26 = v11;
  uint64_t v27 = v8;
  uint64_t v28 = v7;
  id v25 = v15;
  sub_10002C5C0();
  sub_10002BFA0();
  if (v30)
  {
    unint64_t v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
    uint64_t v17 = (unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v18 = (void (**)(char *, char *, uint64_t))(v29 + 32);
    uint64_t v19 = (void (**)(char *, uint64_t))(v29 + 8);
    while (1)
    {
      int v20 = swift_dynamicCast();
      unint64_t v21 = *v16;
      if (!v20) {
        break;
      }
      v21(v2, 0, 1, v3);
      if ((*v17)(v2, 1, v3) == 1) {
        goto LABEL_6;
      }
      (*v18)(v6, v2, v3);
      char v22 = sub_10001DCB8();
      (*v19)(v6, v3);
      if ((v22 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);

        return 0;
      }
LABEL_7:
      sub_10002BFA0();
      if (!v30) {
        goto LABEL_12;
      }
    }
    v21(v2, 1, 1, v3);
LABEL_6:
    sub_10001D2EC((uint64_t)v2, &qword_10003D020);
    goto LABEL_7;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);

  return 1;
}

uint64_t sub_10001DCB8()
{
  uint64_t v0 = sub_100008BE0(&qword_10003D030);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v27 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v27 - v4;
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - v6;
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100008BE0(&qword_10003CA28);
  uint64_t v8 = swift_allocObject();
  long long v29 = xmmword_10002D3D0;
  *(_OWORD *)(v8 + 16) = xmmword_10002D3D0;
  uint64_t v9 = sub_10002C020();
  uint64_t v11 = v10;
  *(void *)(v8 + 56) = &type metadata for String;
  unint64_t v28 = sub_10000A8CC();
  *(void *)(v8 + 64) = v28;
  *(void *)(v8 + 32) = v9;
  *(void *)(v8 + 40) = v11;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_100008BE0(&qword_10003D028);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002E5B0;
  *(void *)(inited + 32) = NSURLIsRegularFileKey;
  *(void *)(inited + 40) = NSURLIsDirectoryKey;
  uint64_t v13 = NSURLIsRegularFileKey;
  unint64_t v14 = NSURLIsDirectoryKey;
  sub_10001E128(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_10002BFD0();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_10002BF80();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
  sub_10001E358((uint64_t)v7, (uint64_t)v5);
  sub_10002BF80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v5, 1, v15) == 1) {
    goto LABEL_6;
  }
  unsigned __int8 v18 = sub_10002BF70();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v16 + 8);
  v19(v5, v15);
  if (v18 != 2)
  {
    uint64_t v5 = v27;
    sub_10001E358((uint64_t)v7, (uint64_t)v27);
    if (v17(v5, 1, v15) == 1)
    {
LABEL_6:
      sub_10001D2EC((uint64_t)v5, &qword_10003D030);
      goto LABEL_7;
    }
    unsigned __int8 v26 = sub_10002BF60();
    v19(v5, v15);
    if (v26 != 2)
    {
      uint64_t v24 = (v18 | v26) & 1;
      sub_10001D2EC((uint64_t)v7, &qword_10003D030);
      return v24;
    }
  }
LABEL_7:
  sub_10002C5F0();
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v29;
  uint64_t v21 = sub_10002C020();
  unint64_t v22 = v28;
  *(void *)(v20 + 56) = &type metadata for String;
  *(void *)(v20 + 64) = v22;
  *(void *)(v20 + 32) = v21;
  *(void *)(v20 + 40) = v23;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  sub_10001D2EC((uint64_t)v7, &qword_10003D030);
  return 0;
}

void *sub_10001E128(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100008BE0(&qword_10003D038);
    uint64_t v3 = sub_10002C6A0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_10002C480();
      sub_10002C970();
      id v7 = v6;
      sub_10002C4E0();
      Swift::Int v8 = sub_10002C990();
      unint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_10002C480();
        uint64_t v17 = v16;
        if (v15 == sub_10002C480() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_10002C900();
        swift_bridgeObjectRelease();
        unint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_10002C480();
          uint64_t v24 = v23;
          if (v22 == sub_10002C480() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_10002C900();
          swift_bridgeObjectRelease();
          unint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_10001E358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008BE0(&qword_10003D030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E3C0(char a1)
{
  return *(void *)&aStarttimsample[8 * a1];
}

uint64_t sub_10001E3E0()
{
  return sub_10001E3C0(*v0);
}

uint64_t sub_10001E3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001E9A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001E410(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10001E41C(uint64_t a1)
{
  unint64_t v2 = sub_10001E6D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001E458(uint64_t a1)
{
  unint64_t v2 = sub_10001E6D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001E494()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for SampleTimer()
{
  return self;
}

uint64_t sub_10001E4F0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100008BE0(&qword_10003D150);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::Int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100008C24(a1, a1[3]);
  sub_10001E6D8();
  sub_10002C9B0();
  char v12 = 0;
  sub_10002C860();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v11 = *(void *)(v3 + 32);
    v10[15] = 1;
    sub_100008BE0(&qword_10003CEE0);
    sub_10001E72C();
    sub_10002C8B0();
    LOBYTE(v11) = 2;
    sub_10002C8C0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001E6B4(void *a1)
{
  return sub_10001E4F0(a1);
}

unint64_t sub_10001E6D8()
{
  unint64_t result = qword_10003D158;
  if (!qword_10003D158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D158);
  }
  return result;
}

unint64_t sub_10001E72C()
{
  unint64_t result = qword_10003D160;
  if (!qword_10003D160)
  {
    sub_100008D30(&qword_10003CEE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D160);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SampleTimer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001E864);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleTimer.CodingKeys()
{
  return &type metadata for SampleTimer.CodingKeys;
}

unint64_t sub_10001E8A0()
{
  unint64_t result = qword_10003D168;
  if (!qword_10003D168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D168);
  }
  return result;
}

unint64_t sub_10001E8F8()
{
  unint64_t result = qword_10003D170;
  if (!qword_10003D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D170);
  }
  return result;
}

unint64_t sub_10001E950()
{
  unint64_t result = qword_10003D178;
  if (!qword_10003D178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D178);
  }
  return result;
}

uint64_t sub_10001E9A4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D69547472617473 && a2 == 0xE900000000000065;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656C706D6173 && a2 == 0xE700000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617265704F6D756ELL && a2 == 0xED0000736E6F6974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV14NamedValueTypeVMa()
{
  return &_s14ModelStructureO7ProgramV14NamedValueTypeVN;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a2 + 40;
  uint64_t v6 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    *(void *)(a1 + 40) = v6;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v7;
    *(void *)(a1 + 56) = *(void *)(v7 + 16);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 40);
  uint64_t v6 = (_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v5)
    {
      *(void *)(a1 + 40) = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001EE98(a1 + 40);
      uint64_t v7 = *(void *)(a2 + 56);
      _OWORD *v4 = *v6;
      *(void *)(a1 + 56) = v7;
    }
  }
  else if (v5)
  {
    *(void *)(a1 + 40) = v5;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *v6;
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    _OWORD *v4 = v8;
  }
  uint64_t v9 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v9;
  return a1;
}

uint64_t sub_10001EE98(uint64_t a1)
{
  return a1;
}

__n128 _s14ModelStructureO7ProgramV9OperationVwtk(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  if (!v5)
  {
    sub_10001EE98(a1 + 40);
LABEL_5:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    goto LABEL_6;
  }
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV9OperationVMa()
{
  return &_s14ModelStructureO7ProgramV9OperationVN;
}

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV7BindingOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t _s14ModelStructureO7ProgramV7BindingOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_10001F158(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10001F170(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8ArgumentVMa()
{
  return &_s14ModelStructureO7ProgramV8ArgumentVN;
}

uint64_t _s14ModelStructureO7ProgramV5BlockVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14ModelStructureO7ProgramV5BlockVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s14ModelStructureO7ProgramV5BlockVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV5BlockVwta(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s14ModelStructureO7ProgramV5BlockVMa()
{
  return &_s14ModelStructureO7ProgramV5BlockVN;
}

ValueMetadata *_s14ModelStructureO7ProgramVMa()
{
  return &_s14ModelStructureO7ProgramVN;
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14ModelStructureO7ProgramV8FunctionVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s14ModelStructureO7ProgramV8FunctionVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 _s14ModelStructureO7ProgramV8FunctionVwtk(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *_s14ModelStructureO7ProgramV8FunctionVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV8FunctionVMa()
{
  return &_s14ModelStructureO7ProgramV8FunctionVN;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkVMa()
{
  return &_s14ModelStructureO13NeuralNetworkVN;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v8 = a2 + 48;
  uint64_t v7 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 48) = v7;
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v8;
    *(void *)(a1 + 64) = *(void *)(v8 + 16);
  }
  return a1;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  uint64_t v6 = (_OWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v5)
    {
      *(void *)(a1 + 48) = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001EE98(a1 + 48);
      uint64_t v7 = *(void *)(a2 + 64);
      _OWORD *v4 = *v6;
      *(void *)(a1 + 64) = v7;
    }
  }
  else if (v5)
  {
    *(void *)(a1 + 48) = v5;
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *v6;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    _OWORD *v4 = v8;
  }
  return a1;
}

__n128 _s14ModelStructureO13NeuralNetworkV5LayerVwtk(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  if (!v6)
  {
    sub_10001EE98(a1 + 48);
LABEL_5:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    return a1;
  }
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV5LayerVMa()
{
  return &_s14ModelStructureO13NeuralNetworkV5LayerVN;
}

uint64_t _s11DeviceUsageVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s11DeviceUsageVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s11DeviceUsageVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11DeviceUsageVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11DeviceUsageVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10001FB00(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s11DeviceUsageVMa()
{
  return &_s11DeviceUsageVN;
}

uint64_t _s11DeviceUsageV12SupportStateOwCP(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t _s11DeviceUsageV12SupportStateOwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s11DeviceUsageV12SupportStateOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_10001FBB4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001FBD0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *_s11DeviceUsageV12SupportStateOMa()
{
  return &_s11DeviceUsageV12SupportStateON;
}

uint64_t _s14ModelStructureOwxx(uint64_t a1)
{
  return sub_1000088C0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s14ModelStructureOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100008804(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s14ModelStructureOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100008804(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000088C0(v6, v7, v8);
  return a1;
}

uint64_t _s14ModelStructureOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000088C0(v4, v5, v6);
  return a1;
}

uint64_t sub_10001FD00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_10001FD18(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s14ModelStructureOMa()
{
  return &_s14ModelStructureON;
}

uint64_t sub_10001FD40(char a1)
{
  if (a1) {
    return 1701869940;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_10001FD60(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D210);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned __int8 v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100024070();
  sub_10002C9B0();
  char v10 = 0;
  sub_10002C880();
  if (!v1)
  {
    char v9 = 1;
    sub_100024118();
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001FED8(char a1)
{
  if (a1) {
    return 1701667182;
  }
  else {
    return 0x65756C6176;
  }
}

uint64_t sub_10001FF04(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = sub_100008BE0(&qword_10003D318);
  uint64_t v19 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unsigned __int8 v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008BE0(&qword_10003D320);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  __chkstk_darwin(v7);
  char v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008BE0(&qword_10003D328);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100025F78();
  sub_10002C9B0();
  if (v20)
  {
    char v22 = 1;
    sub_100025FCC();
    sub_10002C840();
    sub_10002C880();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  }
  else
  {
    char v21 = 0;
    sub_100026020();
    sub_10002C840();
    sub_1000260C8();
    uint64_t v14 = v17;
    sub_10002C8B0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1000201F0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100008BE0(&qword_10003D360);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002611C();
  sub_10002C9B0();
  v9[1] = a2;
  sub_100008BE0(&qword_10003D348);
  sub_10002ACB0(&qword_10003D368, &qword_10003D348, (void (*)(void))sub_1000261C4);
  sub_10002C8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100020378(char a1)
{
  if (a1) {
    return 0x6B636F6C62;
  }
  else {
    return 0x737475706E69;
  }
}

uint64_t sub_1000203A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v9 = sub_100008BE0(&qword_10003D420);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002674C();
  sub_10002C9B0();
  uint64_t v17 = a2;
  char v20 = 0;
  sub_100008BE0(&qword_10003D248);
  sub_10002ACB0(&qword_10003D2A0, &qword_10003D248, (void (*)(void))sub_100025DC4);
  sub_10002C8B0();
  if (!v5)
  {
    uint64_t v17 = a3;
    uint64_t v18 = v15;
    uint64_t v19 = v16;
    char v20 = 1;
    sub_100025E18();
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100020590(char a1)
{
  return *(void *)&aInputs_0[8 * a1];
}

uint64_t sub_1000205B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v8 = sub_100008BE0(&qword_10003D3B0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100026218();
  sub_10002C9B0();
  uint64_t v15 = a2;
  char v14 = 0;
  sub_100008BE0(&qword_10003D248);
  sub_10002ACB0(&qword_10003D2A0, &qword_10003D248, (void (*)(void))sub_100025DC4);
  sub_10002C8B0();
  if (!v4)
  {
    uint64_t v15 = v13;
    char v14 = 1;
    sub_100008BE0(&qword_10003D388);
    sub_1000262C0(&qword_10003D3B8);
    sub_10002C8B0();
    uint64_t v15 = a4;
    char v14 = 2;
    sub_100008BE0(&qword_10003D398);
    sub_10002ACB0(&qword_10003D3C0, &qword_10003D398, (void (*)(void))sub_100026324);
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100020840(char a1)
{
  return *(void *)&aOperatorinputs[8 * a1];
}

uint64_t sub_100020860(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100008BE0(&qword_10003D288);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100025A7C();
  sub_10002C9B0();
  LOBYTE(v11[0]) = 0;
  sub_10002C880();
  if (!v2)
  {
    v11[0] = v3[2];
    char v12 = 1;
    sub_100008BE0(&qword_10003D230);
    sub_100025CF4(&qword_10003D290, (void (*)(void))sub_100025D70);
    sub_10002C8B0();
    v11[0] = v3[3];
    char v12 = 2;
    sub_100008BE0(&qword_10003D248);
    sub_10002ACB0(&qword_10003D2A0, &qword_10003D248, (void (*)(void))sub_100025DC4);
    sub_10002C8B0();
    v11[0] = v3[4];
    char v12 = 3;
    sub_100008BE0(&qword_10003D260);
    sub_10002ACB0(&qword_10003D2B0, &qword_10003D260, (void (*)(void))sub_100025E18);
    sub_10002C8B0();
    sub_100025EC0((uint64_t)(v3 + 5), (uint64_t)v14, &qword_10003D2C0);
    sub_100025EC0((uint64_t)v14, (uint64_t)v11, &qword_10003D2C0);
    char v12 = 4;
    sub_100025E6C();
    sub_10002C870();
    sub_100025EC0((uint64_t)(v3 + 8), (uint64_t)v13, &qword_10003D2D0);
    sub_100025EC0((uint64_t)v13, (uint64_t)v11, &qword_10003D2D0);
    char v12 = 5;
    sub_100025F24();
    sub_10002C870();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100020BE4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100008BE0(&qword_10003D3F8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_1000265D4();
  sub_10002C9B0();
  v9[1] = a2;
  sub_100008BE0(&qword_10003D3E0);
  sub_100026628(&qword_10003D400, (void (*)(void))sub_1000266F8);
  sub_10002C8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100020D6C(char a1)
{
  return *(void *)&aName_1[8 * a1];
}

uint64_t sub_100020D8C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100008BE0(&qword_10003D478);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_1000271B0();
  sub_10002C9B0();
  LOBYTE(v11[0]) = 0;
  sub_10002C880();
  if (!v2)
  {
    LOBYTE(v11[0]) = 1;
    sub_10002C880();
    v11[0] = *(void *)(v3 + 32);
    char v12 = 2;
    sub_100008BE0(&qword_10003D388);
    sub_1000262C0(&qword_10003D3B8);
    sub_10002C8B0();
    v11[0] = *(void *)(v3 + 40);
    char v12 = 3;
    sub_10002C8B0();
    sub_100025EC0(v3 + 48, (uint64_t)v13, &qword_10003D2C0);
    sub_100025EC0((uint64_t)v13, (uint64_t)v11, &qword_10003D2C0);
    char v12 = 4;
    sub_100025E6C();
    sub_10002C870();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100020FF8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100008BE0(&qword_10003D450);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_1000270B4();
  sub_10002C9B0();
  v9[1] = a2;
  sub_100008BE0(&qword_10003D438);
  sub_10002ACB0(&qword_10003D458, &qword_10003D438, (void (*)(void))sub_10002715C);
  sub_10002C8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100021180()
{
  return 0x6C65646F4D627573;
}

uint64_t sub_1000211B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100008BE0(&qword_10003D750);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002AB0C();
  sub_10002C9B0();
  uint64_t v14 = a2;
  char v13 = 0;
  sub_100008BE0(&qword_10003D388);
  sub_1000262C0(&qword_10003D3B8);
  sub_10002C8B0();
  if (!v3)
  {
    uint64_t v14 = a3;
    char v13 = 1;
    sub_100008BE0(&qword_10003D760);
    sub_10002ACB0(&qword_10003D768, &qword_10003D760, (void (*)(void))sub_100008E28);
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000213BC(char a1)
{
  return *(void *)&aNeuralneprogra[8 * a1];
}

uint64_t sub_1000213DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = a4;
  *(void *)&long long v42 = a3;
  *((void *)&v42 + 1) = a2;
  uint64_t v5 = sub_100008BE0(&qword_10003D180);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  __chkstk_darwin(v5);
  char v34 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008BE0(&qword_10003D188);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  __chkstk_darwin(v7);
  uint64_t v31 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008BE0(&qword_10003D190);
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v41 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008BE0(&qword_10003D198);
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v39 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100008BE0(&qword_10003D1A0);
  uint64_t v37 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100008BE0(&qword_10003D1A8);
  uint64_t v18 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  char v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100023774();
  sub_10002C9B0();
  switch((char)v46)
  {
    case 1:
      LOBYTE(v44) = 1;
      sub_100023918();
      uint64_t v23 = v43;
      sub_10002C840();
      uint64_t v44 = *((void *)&v42 + 1);
      sub_10002396C();
      uint64_t v24 = v39;
      sub_10002C8B0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v24);
      goto LABEL_5;
    case 2:
      LOBYTE(v44) = 2;
      sub_100023870();
      uint64_t v23 = v43;
      sub_10002C840();
      uint64_t v44 = *((void *)&v42 + 1);
      uint64_t v45 = v42;
      sub_1000238C4();
      uint64_t v25 = v41;
      sub_10002C8B0();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v25);
LABEL_5:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v23);
      break;
    case 3:
      if (v42 == 0)
      {
        LOBYTE(v44) = 3;
        sub_10002381C();
        unsigned __int8 v26 = v31;
        uint64_t v27 = v43;
        sub_10002C840();
        uint64_t v29 = v32;
        uint64_t v28 = v33;
      }
      else
      {
        LOBYTE(v44) = 4;
        sub_1000237C8();
        unsigned __int8 v26 = v34;
        uint64_t v27 = v43;
        sub_10002C840();
        uint64_t v29 = v35;
        uint64_t v28 = v36;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v27);
      break;
    default:
      LOBYTE(v44) = 0;
      sub_1000239C0();
      uint64_t v21 = v43;
      sub_10002C840();
      uint64_t v44 = *((void *)&v42 + 1);
      sub_100023A14();
      sub_10002C8B0();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v15);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v21);
      break;
  }
  return result;
}

uint64_t sub_1000219E8(char a1)
{
  if (a1) {
    return 0x726F707075736E75;
  }
  else {
    return 0x6574726F70707573;
  }
}

uint64_t sub_100021A2C(void *a1, uint64_t a2, int a3)
{
  int v21 = a3;
  uint64_t v17 = a2;
  uint64_t v4 = sub_100008BE0(&qword_10003D508);
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100008BE0(&qword_10003D510);
  uint64_t v7 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008BE0(&qword_10003D518);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100028D88();
  sub_10002C9B0();
  if (v21)
  {
    char v22 = 0;
    sub_100028E84();
    sub_10002C840();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
  }
  else
  {
    char v23 = 1;
    sub_100028DDC();
    sub_10002C840();
    uint64_t v20 = v17;
    sub_100028ED8();
    uint64_t v14 = v19;
    sub_10002C8B0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_100021D2C(char a1)
{
  if (!a1) {
    return 0x6574726F70707573;
  }
  if (a1 == 1) {
    return 0x6572726566657270;
  }
  return 0xD000000000000010;
}

uint64_t sub_100021D90(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  int v14 = a3;
  uint64_t v8 = sub_100008BE0(&qword_10003D4B8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100028BB0();
  sub_10002C9B0();
  uint64_t v16 = a2;
  char v15 = 0;
  sub_100008BE0(&qword_10003C9F0);
  sub_10002ACB0((unint64_t *)&qword_10003C9F8, &qword_10003C9F0, (void (*)(void))sub_100008D78);
  sub_10002C8B0();
  if (!v4)
  {
    LOBYTE(v16) = v14;
    char v15 = 1;
    sub_100008D78();
    sub_10002C8B0();
    uint64_t v16 = a4;
    char v15 = 2;
    sub_100008BE0(&qword_10003D4A0);
    sub_100028CAC(&qword_10003D4C0, (void (*)(void))sub_100008D78, (void (*)(void))sub_100028D34);
    sub_10002C8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100021FFC(uint64_t a1)
{
  unint64_t v2 = sub_10002AB60();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022038(uint64_t a1)
{
  unint64_t v2 = sub_10002AB60();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022074(uint64_t a1)
{
  return sub_1000112E4(a1);
}

uint64_t sub_10002209C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10002218C(a1, a2, a3, &qword_10003D770, (void (*)(void))sub_10002AB60);
}

uint64_t sub_1000220D8(uint64_t a1)
{
  unint64_t v2 = sub_10002AC08();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022114(uint64_t a1)
{
  unint64_t v2 = sub_10002AC08();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022150(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10002218C(a1, a2, a3, &qword_10003D798, (void (*)(void))sub_10002AC08);
}

uint64_t sub_10002218C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = sub_100008BE0(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  a5();
  sub_10002C9B0();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000222AC()
{
  return sub_10001FD40(*v0);
}

uint64_t sub_1000222B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100023DA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000222DC(uint64_t a1)
{
  unint64_t v2 = sub_100024070();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022318(uint64_t a1)
{
  unint64_t v2 = sub_100024070();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022354@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100023E74(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_100022380(void *a1)
{
  return sub_10001FD60(a1);
}

uint64_t sub_10002239C()
{
  return sub_10001FED8(*v0);
}

uint64_t sub_1000223A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002416C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000223CC(uint64_t a1)
{
  unint64_t v2 = sub_100025F78();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022408(uint64_t a1)
{
  unint64_t v2 = sub_100025F78();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022450(uint64_t a1)
{
  unint64_t v2 = sub_100025FCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002248C(uint64_t a1)
{
  unint64_t v2 = sub_100025FCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000224C8(uint64_t a1)
{
  unint64_t v2 = sub_100026020();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022504(uint64_t a1)
{
  unint64_t v2 = sub_100026020();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022540@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100024240(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10002256C(void *a1)
{
  return sub_10001FF04(a1, *v1, v1[1]);
}

uint64_t sub_10002258C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100024730(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000225B8(uint64_t a1)
{
  unint64_t v2 = sub_10002611C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000225F4(uint64_t a1)
{
  unint64_t v2 = sub_10002611C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100022630@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000247D0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10002265C(void *a1)
{
  return sub_1000201F0(a1, *v1);
}

uint64_t sub_100022678()
{
  return sub_100020378(*v0);
}

uint64_t sub_100022680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100024980(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000226A8(uint64_t a1)
{
  unint64_t v2 = sub_10002674C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000226E4(uint64_t a1)
{
  unint64_t v2 = sub_10002674C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022720@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100024A5C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_100022750(void *a1)
{
  return sub_1000203A8(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_100022770()
{
  return sub_100020590(*v0);
}

uint64_t sub_100022778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100024CDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000227A0(uint64_t a1)
{
  unint64_t v2 = sub_100026218();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000227DC(uint64_t a1)
{
  unint64_t v2 = sub_100026218();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022818@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100024E34(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_100022848(void *a1)
{
  return sub_1000205B0(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_100022868()
{
  return sub_100020840(*v0);
}

uint64_t sub_100022870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100025198(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100022898(uint64_t a1)
{
  unint64_t v2 = sub_100025A7C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000228D4(uint64_t a1)
{
  unint64_t v2 = sub_100025A7C();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100022910@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000253F4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10002295C(void *a1)
{
  return sub_100020860(a1);
}

uint64_t sub_1000229A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100026378(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000229D0(uint64_t a1)
{
  unint64_t v2 = sub_1000265D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022A0C(uint64_t a1)
{
  unint64_t v2 = sub_1000265D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100022A48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100026424(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100022A74(void *a1)
{
  return sub_100020BE4(a1, *v1);
}

uint64_t sub_100022A90()
{
  return sub_100020D6C(*v0);
}

uint64_t sub_100022A98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000267A0(a1, a2);
  *a3 = result;
  return result;
}

void sub_100022AC0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100022ACC(uint64_t a1)
{
  unint64_t v2 = sub_1000271B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022B08(uint64_t a1)
{
  unint64_t v2 = sub_1000271B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100022B44@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000269A8(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100022B98(void *a1)
{
  return sub_100020D8C(a1);
}

uint64_t sub_100022BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100026E70(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100022C0C(uint64_t a1)
{
  unint64_t v2 = sub_1000270B4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022C48(uint64_t a1)
{
  unint64_t v2 = sub_1000270B4();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100022C84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100026F04(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100022CB0(void *a1)
{
  return sub_100020FF8(a1, *v1);
}

uint64_t sub_100022CCC()
{
  return sub_100021180();
}

uint64_t sub_100022CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100027204(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100022CFC(uint64_t a1)
{
  unint64_t v2 = sub_10002AB0C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022D38(uint64_t a1)
{
  unint64_t v2 = sub_10002AB0C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022D74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100027308(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_100022DA0(void *a1)
{
  return sub_1000211B4(a1, *v1, v1[1]);
}

uint64_t sub_100022DBC()
{
  return sub_1000213BC(*v0);
}

uint64_t sub_100022DC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002758C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100022DEC(uint64_t a1)
{
  unint64_t v2 = sub_100023774();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022E28(uint64_t a1)
{
  unint64_t v2 = sub_100023774();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022E64(uint64_t a1)
{
  unint64_t v2 = sub_10002381C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022EA0(uint64_t a1)
{
  unint64_t v2 = sub_10002381C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022EDC(uint64_t a1)
{
  unint64_t v2 = sub_1000239C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022F18(uint64_t a1)
{
  unint64_t v2 = sub_1000239C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022F54(uint64_t a1)
{
  unint64_t v2 = sub_100023870();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022F90(uint64_t a1)
{
  unint64_t v2 = sub_100023870();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022FCC(uint64_t a1)
{
  unint64_t v2 = sub_100023918();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023008(uint64_t a1)
{
  unint64_t v2 = sub_100023918();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100023044(uint64_t a1)
{
  unint64_t v2 = sub_1000237C8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023080(uint64_t a1)
{
  unint64_t v2 = sub_1000237C8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000230BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000277AC(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_1000230EC(void *a1)
{
  return sub_1000213DC(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_10002310C()
{
  return sub_1000219E8(*v0);
}

uint64_t sub_100023114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000280A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002313C(uint64_t a1)
{
  unint64_t v2 = sub_100028D88();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023178(uint64_t a1)
{
  unint64_t v2 = sub_100028D88();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000231B4(uint64_t a1)
{
  unint64_t v2 = sub_100028E84();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000231F0(uint64_t a1)
{
  unint64_t v2 = sub_100028E84();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002322C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000281A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100023258(uint64_t a1)
{
  unint64_t v2 = sub_100028DDC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023294(uint64_t a1)
{
  unint64_t v2 = sub_100028DDC();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_1000232D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100028224(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
  }
  return result;
}

uint64_t sub_100023304(void *a1)
{
  return sub_100021A2C(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

unint64_t sub_100023324()
{
  return 0xD000000000000010;
}

uint64_t sub_100023340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000286D0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10002336C(uint64_t a1)
{
  unint64_t v2 = sub_10002AC5C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000233A8(uint64_t a1)
{
  unint64_t v2 = sub_10002AC5C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000233E4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100008BE0(&qword_10003D7A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002AC5C();
  sub_10002C9A0();
  if (v2) {
    return sub_1000112E4((uint64_t)a1);
  }
  uint64_t v9 = sub_10002C810();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1000112E4((uint64_t)a1);
  *a2 = v9;
  return result;
}

uint64_t sub_100023540(void *a1)
{
  uint64_t v2 = sub_100008BE0(&qword_10003D7B8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002AC5C();
  sub_10002C9B0();
  sub_10002C8A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100023674()
{
  return sub_100021D2C(*v0);
}

uint64_t sub_10002367C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100028758(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000236A4(uint64_t a1)
{
  unint64_t v2 = sub_100028BB0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000236E0(uint64_t a1)
{
  unint64_t v2 = sub_100028BB0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002371C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000288AC(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_100023750(void *a1)
{
  return sub_100021D90(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16));
}

unint64_t sub_100023774()
{
  unint64_t result = qword_10003D1B0;
  if (!qword_10003D1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1B0);
  }
  return result;
}

unint64_t sub_1000237C8()
{
  unint64_t result = qword_10003D1B8;
  if (!qword_10003D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1B8);
  }
  return result;
}

unint64_t sub_10002381C()
{
  unint64_t result = qword_10003D1C0;
  if (!qword_10003D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1C0);
  }
  return result;
}

unint64_t sub_100023870()
{
  unint64_t result = qword_10003D1C8;
  if (!qword_10003D1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1C8);
  }
  return result;
}

unint64_t sub_1000238C4()
{
  unint64_t result = qword_10003D1D0;
  if (!qword_10003D1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1D0);
  }
  return result;
}

unint64_t sub_100023918()
{
  unint64_t result = qword_10003D1D8;
  if (!qword_10003D1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1D8);
  }
  return result;
}

unint64_t sub_10002396C()
{
  unint64_t result = qword_10003D1E0;
  if (!qword_10003D1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1E0);
  }
  return result;
}

unint64_t sub_1000239C0()
{
  unint64_t result = qword_10003D1E8;
  if (!qword_10003D1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1E8);
  }
  return result;
}

unint64_t sub_100023A14()
{
  unint64_t result = qword_10003D1F0;
  if (!qword_10003D1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1F0);
  }
  return result;
}

uint64_t sub_100023A6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002B3F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100023A98(uint64_t a1)
{
  unint64_t v2 = sub_10002ABB4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023AD4(uint64_t a1)
{
  unint64_t v2 = sub_10002ABB4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100023B10@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100008BE0(&qword_10003D780);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002ABB4();
  sub_10002C9A0();
  if (v2) {
    return sub_1000112E4((uint64_t)a1);
  }
  sub_10002C800();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1000112E4((uint64_t)a1);
  *a2 = v10;
  return result;
}

uint64_t sub_100023C74(void *a1)
{
  uint64_t v2 = sub_100008BE0(&qword_10003D790);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_10002ABB4();
  sub_10002C9B0();
  sub_10002C890();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100023DA8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100023E74(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D1F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_100008C24(a1, a1[3]);
  sub_100024070();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    v9[15] = 0;
    uint64_t v7 = sub_10002C7F0();
    v9[14] = 1;
    sub_1000240C4();
    swift_bridgeObjectRetain();
    sub_10002C820();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_1000112E4((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_100024070()
{
  unint64_t result = qword_10003D200;
  if (!qword_10003D200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D200);
  }
  return result;
}

unint64_t sub_1000240C4()
{
  unint64_t result = qword_10003D208;
  if (!qword_10003D208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D208);
  }
  return result;
}

unint64_t sub_100024118()
{
  unint64_t result = qword_10003D218;
  if (!qword_10003D218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D218);
  }
  return result;
}

uint64_t sub_10002416C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100024240(void *a1)
{
  uint64_t v2 = sub_100008BE0(&qword_10003D2E0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008BE0(&qword_10003D2E8);
  uint64_t v24 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008BE0(&qword_10003D2F0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v27 = a1;
  uint64_t v13 = (uint64_t)sub_100008C24(a1, v12);
  sub_100025F78();
  uint64_t v14 = v28;
  sub_10002C9A0();
  if (!v14)
  {
    uint64_t v15 = v5;
    uint64_t v16 = v26;
    uint64_t v28 = v9;
    uint64_t v17 = sub_10002C830();
    if (*(void *)(v17 + 16) == 1)
    {
      if (*(unsigned char *)(v17 + 32))
      {
        char v30 = 1;
        sub_100025FCC();
        sub_10002C7C0();
        uint64_t v24 = v8;
        uint64_t v13 = sub_10002C7F0();
        uint64_t v18 = v28;
        (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v16);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v24);
      }
      else
      {
        char v29 = 0;
        sub_100026020();
        sub_10002C7C0();
        sub_100026074();
        sub_10002C820();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v19 = sub_10002C6E0();
      swift_allocError();
      int v21 = v20;
      sub_100008BE0(&qword_10003CE48);
      uint64_t v13 = (uint64_t)v11;
      void *v21 = &_s14ModelStructureO7ProgramV7BindingON;
      sub_10002C7D0();
      sub_10002C6D0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
    }
  }
  sub_1000112E4((uint64_t)v27);
  return v13;
}

uint64_t sub_100024730(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73676E69646E6962 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1000247B8()
{
  return 0x73676E69646E6962;
}

void *sub_1000247D0(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D338);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008C24(a1, a1[3]);
  sub_10002611C();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D348);
    sub_10002ACB0(&qword_10003D350, &qword_10003D348, (void (*)(void))sub_100026170);
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_1000112E4((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_100024980(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737475706E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B636F6C62 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100024A5C(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D410);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100008C24(a1, v7);
  sub_10002674C();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D248);
    char v10 = 0;
    sub_10002ACB0(&qword_10003D250, &qword_10003D248, (void (*)(void))sub_100025B64);
    sub_10002C820();
    uint64_t v7 = v9;
    char v10 = 1;
    sub_100025BB8();
    swift_bridgeObjectRetain();
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000112E4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_100024CDC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737475706E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614E74757074756FLL && a2 == 0xEB0000000073656DLL || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F6974617265706FLL && a2 == 0xEA0000000000736ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100024E34(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D378);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100008C24(a1, v7);
  sub_100026218();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D248);
    char v10 = 0;
    sub_10002ACB0(&qword_10003D250, &qword_10003D248, (void (*)(void))sub_100025B64);
    sub_10002C820();
    uint64_t v7 = v11;
    sub_100008BE0(&qword_10003D388);
    char v10 = 1;
    sub_1000262C0(&qword_10003D390);
    swift_bridgeObjectRetain();
    sub_10002C820();
    sub_100008BE0(&qword_10003D398);
    char v10 = 2;
    sub_10002ACB0(&qword_10003D3A0, &qword_10003D398, (void (*)(void))sub_10002626C);
    swift_bridgeObjectRetain();
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_1000112E4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_100025198(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F74617265706FLL && a2 == 0xEC000000656D614ELL;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737475706E69 && a2 == 0xE600000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7374757074756FLL && a2 == 0xE700000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736B636F6C62 && a2 == 0xE600000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7355656369766564 && a2 == 0xEB00000000656761 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1953722211 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_1000253F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100008BE0(&qword_10003D220);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_100025A7C();
  sub_10002C9A0();
  if (v2) {
    return sub_1000112E4((uint64_t)a1);
  }
  LOBYTE(v33) = 0;
  uint64_t v9 = sub_10002C7F0();
  uint64_t v11 = v10;
  sub_100008BE0(&qword_10003D230);
  char v37 = 1;
  sub_100025CF4(&qword_10003D238, (void (*)(void))sub_100025B10);
  swift_bridgeObjectRetain();
  sub_10002C820();
  uint64_t v28 = v9;
  uint64_t v32 = v11;
  uint64_t v12 = v33;
  sub_100008BE0(&qword_10003D248);
  char v37 = 2;
  sub_10002ACB0(&qword_10003D250, &qword_10003D248, (void (*)(void))sub_100025B64);
  swift_bridgeObjectRetain();
  sub_10002C820();
  uint64_t v27 = v12;
  uint64_t v13 = v33;
  sub_100008BE0(&qword_10003D260);
  char v37 = 3;
  sub_10002ACB0(&qword_10003D268, &qword_10003D260, (void (*)(void))sub_100025BB8);
  uint64_t v31 = v13;
  swift_bridgeObjectRetain();
  uint64_t v26 = 0;
  sub_10002C820();
  uint64_t v14 = v33;
  char v37 = 4;
  sub_100025C0C();
  swift_bridgeObjectRetain();
  sub_10002C7E0();
  uint64_t v25 = v14;
  uint64_t v15 = v34;
  char v37 = 5;
  uint64_t v30 = v33;
  uint64_t v24 = v35;
  sub_100025C60(v33);
  sub_100025CA0();
  sub_10002C7E0();
  uint64_t v29 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v26 = v33;
  int v36 = v34;
  swift_bridgeObjectRetain();
  uint64_t v16 = v27;
  swift_bridgeObjectRetain();
  uint64_t v17 = v31;
  swift_bridgeObjectRetain();
  uint64_t v18 = v25;
  swift_bridgeObjectRetain();
  uint64_t v19 = v30;
  uint64_t v20 = v24;
  sub_100025C60(v30);
  sub_100025AD0(v19);
  uint64_t v21 = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000112E4((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = v29;
  uint64_t result = sub_100025AD0(v19);
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = v17;
  *(void *)(a2 + 32) = v18;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = v22;
  *(void *)(a2 + 56) = v20;
  *(void *)(a2 + 64) = v26;
  *(unsigned char *)(a2 + 72) = v36;
  return result;
}

unint64_t sub_100025A7C()
{
  unint64_t result = qword_10003D228;
  if (!qword_10003D228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D228);
  }
  return result;
}

uint64_t sub_100025AD0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100025B10()
{
  unint64_t result = qword_10003D240;
  if (!qword_10003D240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D240);
  }
  return result;
}

unint64_t sub_100025B64()
{
  unint64_t result = qword_10003D258;
  if (!qword_10003D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D258);
  }
  return result;
}

unint64_t sub_100025BB8()
{
  unint64_t result = qword_10003D270;
  if (!qword_10003D270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D270);
  }
  return result;
}

unint64_t sub_100025C0C()
{
  unint64_t result = qword_10003D278;
  if (!qword_10003D278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D278);
  }
  return result;
}

uint64_t sub_100025C60(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_100025CA0()
{
  unint64_t result = qword_10003D280;
  if (!qword_10003D280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D280);
  }
  return result;
}

uint64_t sub_100025CF4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(&qword_10003D230);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100025D70()
{
  unint64_t result = qword_10003D298;
  if (!qword_10003D298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D298);
  }
  return result;
}

unint64_t sub_100025DC4()
{
  unint64_t result = qword_10003D2A8;
  if (!qword_10003D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2A8);
  }
  return result;
}

unint64_t sub_100025E18()
{
  unint64_t result = qword_10003D2B8;
  if (!qword_10003D2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2B8);
  }
  return result;
}

unint64_t sub_100025E6C()
{
  unint64_t result = qword_10003D2C8;
  if (!qword_10003D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2C8);
  }
  return result;
}

uint64_t sub_100025EC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008BE0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100025F24()
{
  unint64_t result = qword_10003D2D8;
  if (!qword_10003D2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2D8);
  }
  return result;
}

unint64_t sub_100025F78()
{
  unint64_t result = qword_10003D2F8;
  if (!qword_10003D2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2F8);
  }
  return result;
}

unint64_t sub_100025FCC()
{
  unint64_t result = qword_10003D300;
  if (!qword_10003D300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D300);
  }
  return result;
}

unint64_t sub_100026020()
{
  unint64_t result = qword_10003D308;
  if (!qword_10003D308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D308);
  }
  return result;
}

unint64_t sub_100026074()
{
  unint64_t result = qword_10003D310;
  if (!qword_10003D310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D310);
  }
  return result;
}

unint64_t sub_1000260C8()
{
  unint64_t result = qword_10003D330;
  if (!qword_10003D330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D330);
  }
  return result;
}

unint64_t sub_10002611C()
{
  unint64_t result = qword_10003D340;
  if (!qword_10003D340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D340);
  }
  return result;
}

unint64_t sub_100026170()
{
  unint64_t result = qword_10003D358;
  if (!qword_10003D358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D358);
  }
  return result;
}

unint64_t sub_1000261C4()
{
  unint64_t result = qword_10003D370;
  if (!qword_10003D370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D370);
  }
  return result;
}

unint64_t sub_100026218()
{
  unint64_t result = qword_10003D380;
  if (!qword_10003D380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D380);
  }
  return result;
}

unint64_t sub_10002626C()
{
  unint64_t result = qword_10003D3A8;
  if (!qword_10003D3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3A8);
  }
  return result;
}

uint64_t sub_1000262C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(&qword_10003D388);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100026324()
{
  unint64_t result = qword_10003D3C8;
  if (!qword_10003D3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3C8);
  }
  return result;
}

uint64_t sub_100026378(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6974636E7566 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100026408()
{
  return 0x6E6F6974636E7566;
}

void *sub_100026424(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D3D0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008C24(a1, a1[3]);
  sub_1000265D4();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D3E0);
    sub_100026628(&qword_10003D3E8, (void (*)(void))sub_1000266A4);
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_1000112E4((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_1000265D4()
{
  unint64_t result = qword_10003D3D8;
  if (!qword_10003D3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3D8);
  }
  return result;
}

uint64_t sub_100026628(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(&qword_10003D3E0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000266A4()
{
  unint64_t result = qword_10003D3F0;
  if (!qword_10003D3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3F0);
  }
  return result;
}

unint64_t sub_1000266F8()
{
  unint64_t result = qword_10003D408;
  if (!qword_10003D408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D408);
  }
  return result;
}

unint64_t sub_10002674C()
{
  unint64_t result = qword_10003D418;
  if (!qword_10003D418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D418);
  }
  return result;
}

uint64_t sub_1000267A0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D614E7475706E69 && a2 == 0xEA00000000007365 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x614E74757074756FLL && a2 == 0xEB0000000073656DLL || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7355656369766564 && a2 == 0xEB00000000656761)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1000269A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100008BE0(&qword_10003D468);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008C24(a1, a1[3]);
  sub_1000271B0();
  sub_10002C9A0();
  if (v2) {
    return sub_1000112E4((uint64_t)a1);
  }
  LOBYTE(v33) = 0;
  uint64_t v9 = sub_10002C7F0();
  uint64_t v11 = v10;
  LOBYTE(v33) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_10002C7F0();
  uint64_t v32 = v13;
  uint64_t v27 = v12;
  uint64_t v28 = v9;
  uint64_t v31 = v11;
  sub_100008BE0(&qword_10003D388);
  char v36 = 2;
  uint64_t v14 = sub_1000262C0(&qword_10003D390);
  swift_bridgeObjectRetain();
  uint64_t v29 = v14;
  uint64_t v30 = 0;
  sub_10002C820();
  uint64_t v15 = v33;
  char v36 = 3;
  swift_bridgeObjectRetain();
  sub_10002C820();
  uint64_t v29 = v15;
  uint64_t v16 = v33;
  char v36 = 4;
  sub_100025C0C();
  swift_bridgeObjectRetain();
  sub_10002C7E0();
  uint64_t v17 = v31;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v18 = v33;
  uint64_t v19 = v34;
  uint64_t v30 = v33;
  uint64_t v20 = v35;
  swift_bridgeObjectRetain();
  uint64_t v21 = v16;
  uint64_t v22 = v32;
  swift_bridgeObjectRetain();
  uint64_t v23 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100025C60(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000112E4((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = v30;
  uint64_t result = sub_100025AD0(v30);
  *a2 = v28;
  a2[1] = v17;
  a2[2] = v27;
  a2[3] = v22;
  a2[4] = v23;
  a2[5] = v21;
  a2[6] = v24;
  a2[7] = v19;
  a2[8] = v20;
  return result;
}

uint64_t sub_100026E70(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73726579616CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100026EF0()
{
  return 0x73726579616CLL;
}

void *sub_100026F04(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D428);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008C24(a1, a1[3]);
  sub_1000270B4();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D438);
    sub_10002ACB0(&qword_10003D440, &qword_10003D438, (void (*)(void))sub_100027108);
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_1000112E4((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_1000270B4()
{
  unint64_t result = qword_10003D430;
  if (!qword_10003D430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D430);
  }
  return result;
}

unint64_t sub_100027108()
{
  unint64_t result = qword_10003D448;
  if (!qword_10003D448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D448);
  }
  return result;
}

unint64_t sub_10002715C()
{
  unint64_t result = qword_10003D460;
  if (!qword_10003D460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D460);
  }
  return result;
}

unint64_t sub_1000271B0()
{
  unint64_t result = qword_10003D470;
  if (!qword_10003D470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D470);
  }
  return result;
}

uint64_t sub_100027204(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C65646F4D627573 && a2 == 0xED000073656D614ELL;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F4D627573 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100027308(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D7C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100008C24(a1, v7);
  sub_10002AB0C();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003D388);
    HIBYTE(v9) = 0;
    sub_1000262C0(&qword_10003D390);
    sub_10002C820();
    uint64_t v7 = v10;
    sub_100008BE0(&qword_10003D760);
    HIBYTE(v9) = 1;
    sub_10002ACB0(&qword_10003D7C8, &qword_10003D760, (void (*)(void))sub_10002AD1C);
    swift_bridgeObjectRetain();
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_1000112E4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_10002758C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x654E6C617275656ELL && a2 == 0xED00006B726F7774;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6172676F7270 && a2 == 0xE700000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E696C65706970 && a2 == 0xE800000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7974706D65 && a2 == 0xE500000000000000 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726F707075736E75 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1000277AC(void *a1)
{
  uint64_t v57 = sub_100008BE0(&qword_10003D528);
  uint64_t v47 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v56 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100008BE0(&qword_10003D530);
  uint64_t v50 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  unint64_t v53 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008BE0(&qword_10003D538);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  uint64_t v52 = v5;
  __chkstk_darwin(v4);
  uint64_t v54 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008BE0(&qword_10003D540);
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008BE0(&qword_10003D548);
  uint64_t v46 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100008BE0(&qword_10003D550);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  uint64_t v58 = a1;
  uint64_t v18 = (uint64_t)sub_100008C24(a1, v17);
  sub_100023774();
  uint64_t v19 = v60;
  sub_10002C9A0();
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v43 = v10;
  uint64_t v44 = v12;
  uint64_t v20 = v55;
  uint64_t v21 = v56;
  uint64_t v45 = 0;
  uint64_t v22 = v57;
  uint64_t v60 = v14;
  uint64_t v23 = sub_10002C830();
  if (*(void *)(v23 + 16) != 1)
  {
    uint64_t v27 = v13;
    uint64_t v28 = sub_10002C6E0();
    swift_allocError();
    uint64_t v18 = (uint64_t)v16;
    uint64_t v30 = v29;
    sub_100008BE0(&qword_10003CE48);
    *uint64_t v30 = &_s14ModelStructureON;
    sub_10002C7D0();
    sub_10002C6D0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v28 - 8) + 104))(v30, enum case for DecodingError.typeMismatch(_:), v28);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v18, v27);
LABEL_7:
    uint64_t v31 = (uint64_t)v58;
    goto LABEL_8;
  }
  switch(*(unsigned char *)(v23 + 32))
  {
    case 1:
      LOBYTE(v59) = 1;
      sub_100023918();
      uint64_t v18 = (uint64_t)v16;
      uint64_t v33 = v45;
      sub_10002C7C0();
      if (v33) {
        goto LABEL_17;
      }
      sub_100028F80();
      uint64_t v34 = v49;
      sub_10002C820();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v13);
      uint64_t v18 = v59;
      sub_1000112E4((uint64_t)v58);
      return v18;
    case 2:
      LOBYTE(v59) = 2;
      sub_100023870();
      uint64_t v35 = v54;
      uint64_t v18 = (uint64_t)v16;
      uint64_t v36 = v45;
      sub_10002C7C0();
      if (v36) {
        goto LABEL_17;
      }
      sub_100028F2C();
      uint64_t v37 = v51;
      sub_10002C820();
      uint64_t v38 = v60;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v13);
      uint64_t v18 = v59;
      goto LABEL_20;
    case 3:
      uint64_t v39 = v20;
      LOBYTE(v59) = 3;
      sub_10002381C();
      uint64_t v40 = v53;
      uint64_t v18 = (uint64_t)v16;
      uint64_t v41 = v45;
      sub_10002C7C0();
      if (v41) {
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v13);
      uint64_t v18 = 0;
LABEL_20:
      sub_1000112E4((uint64_t)v58);
      return v18;
    case 4:
      LOBYTE(v59) = 4;
      sub_1000237C8();
      uint64_t v18 = (uint64_t)v16;
      uint64_t v42 = v45;
      sub_10002C7C0();
      if (v42) {
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v22);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v13);
      uint64_t v18 = 1;
      sub_1000112E4((uint64_t)v58);
      return v18;
    default:
      LOBYTE(v59) = 0;
      sub_1000239C0();
      uint64_t v25 = v44;
      uint64_t v24 = v45;
      uint64_t v18 = (uint64_t)v16;
      sub_10002C7C0();
      if (!v24)
      {
        sub_100028FD4();
        uint64_t v26 = v43;
        sub_10002C820();
        (*(void (**)(char *, uint64_t))(v46 + 8))(v25, v26);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v13);
        uint64_t v18 = v59;
        sub_1000112E4((uint64_t)v58);
        return v18;
      }
LABEL_17:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v13);
      uint64_t v31 = (uint64_t)v58;
      break;
  }
LABEL_8:
  sub_1000112E4(v31);
  return v18;
}

uint64_t sub_1000280A4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574726F70707573 && a2 == 0xE900000000000064;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F707075736E75 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000281A8(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100028218()
{
  return 12383;
}

void *sub_100028224(void *a1)
{
  uint64_t v2 = sub_100008BE0(&qword_10003D4D0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008BE0(&qword_10003D4D8);
  uint64_t v26 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008BE0(&qword_10003D4E0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v27 = a1;
  uint64_t v14 = sub_100008C24(a1, v13);
  sub_100028D88();
  uint64_t v15 = v28;
  sub_10002C9A0();
  if (!v15)
  {
    uint64_t v16 = v26;
    uint64_t v28 = v10;
    uint64_t v17 = v12;
    uint64_t v18 = sub_10002C830();
    if (*(void *)(v18 + 16) == 1)
    {
      int v30 = *(unsigned __int8 *)(v18 + 32);
      if (v30)
      {
        uint64_t v26 = v18;
        char v32 = 1;
        sub_100028DDC();
        sub_10002C7C0();
        sub_100028E30();
        uint64_t v23 = v24;
        sub_10002C820();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v23);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v9);
        uint64_t v14 = v29;
      }
      else
      {
        char v31 = 0;
        sub_100028E84();
        sub_10002C7C0();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v9);
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v19 = sub_10002C6E0();
      swift_allocError();
      uint64_t v21 = v20;
      sub_100008BE0(&qword_10003CE48);
      void *v21 = &_s11DeviceUsageV12SupportStateON;
      uint64_t v14 = v17;
      sub_10002C7D0();
      sub_10002C6D0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v9);
    }
  }
  sub_1000112E4((uint64_t)v27);
  return v14;
}

uint64_t sub_1000286D0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000001000315D0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_100028758(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574726F70707573 && a2 == 0xE900000000000064;
  if (v3 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572726566657270 && a2 == 0xE900000000000064 || (sub_10002C900() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001000315B0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10002C900();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1000288AC(void *a1)
{
  uint64_t v3 = sub_100008BE0(&qword_10003D480);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100008C24(a1, v7);
  sub_100028BB0();
  sub_10002C9A0();
  if (v1)
  {
    sub_1000112E4((uint64_t)a1);
  }
  else
  {
    sub_100008BE0(&qword_10003C9F0);
    HIBYTE(v9) = 0;
    sub_10002ACB0(&qword_10003D490, &qword_10003C9F0, (void (*)(void))sub_100028C04);
    sub_10002C820();
    uint64_t v7 = v10;
    HIBYTE(v9) = 1;
    sub_100028C04();
    swift_bridgeObjectRetain();
    sub_10002C820();
    sub_100008BE0(&qword_10003D4A0);
    HIBYTE(v9) = 2;
    sub_100028CAC(&qword_10003D4A8, (void (*)(void))sub_100028C04, (void (*)(void))sub_100028C58);
    sub_10002C820();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_1000112E4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_100028BB0()
{
  unint64_t result = qword_10003D488;
  if (!qword_10003D488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D488);
  }
  return result;
}

unint64_t sub_100028C04()
{
  unint64_t result = qword_10003D498;
  if (!qword_10003D498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D498);
  }
  return result;
}

unint64_t sub_100028C58()
{
  unint64_t result = qword_10003D4B0;
  if (!qword_10003D4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D4B0);
  }
  return result;
}

uint64_t sub_100028CAC(unint64_t *a1, void (*a2)(void), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(&qword_10003D4A0);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100028D34()
{
  unint64_t result = qword_10003D4C8;
  if (!qword_10003D4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D4C8);
  }
  return result;
}

unint64_t sub_100028D88()
{
  unint64_t result = qword_10003D4E8;
  if (!qword_10003D4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D4E8);
  }
  return result;
}

unint64_t sub_100028DDC()
{
  unint64_t result = qword_10003D4F0;
  if (!qword_10003D4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D4F0);
  }
  return result;
}

unint64_t sub_100028E30()
{
  unint64_t result = qword_10003D4F8;
  if (!qword_10003D4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D4F8);
  }
  return result;
}

unint64_t sub_100028E84()
{
  unint64_t result = qword_10003D500;
  if (!qword_10003D500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D500);
  }
  return result;
}

unint64_t sub_100028ED8()
{
  unint64_t result = qword_10003D520;
  if (!qword_10003D520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D520);
  }
  return result;
}

unint64_t sub_100028F2C()
{
  unint64_t result = qword_10003D558;
  if (!qword_10003D558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D558);
  }
  return result;
}

unint64_t sub_100028F80()
{
  unint64_t result = qword_10003D560;
  if (!qword_10003D560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D560);
  }
  return result;
}

unint64_t sub_100028FD4()
{
  unint64_t result = qword_10003D568;
  if (!qword_10003D568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D568);
  }
  return result;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO10CodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO10CodingKeysON;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO19SupportedCodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON;
}

ValueMetadata *_s11DeviceUsageV10CodingKeysOMa()
{
  return &_s11DeviceUsageV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOMa()
{
  return &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV10CodingKeysOMa()
{
  return &_s14ModelStructureO13NeuralNetworkV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8FunctionV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV10CodingKeysON;
}

unsigned char *_s11DeviceUsageV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100029194);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV5BlockV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON;
}

unsigned char *_s14ModelStructureO7ProgramV9OperationV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000292D8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV9OperationV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002947CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO10CodingKeysOMa()
{
  return &_s14ModelStructureO10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO23NeuralNetworkCodingKeysOMa()
{
  return &_s14ModelStructureO23NeuralNetworkCodingKeysON;
}

ValueMetadata *_s14ModelStructureO17ProgramCodingKeysOMa()
{
  return &_s14ModelStructureO17ProgramCodingKeysON;
}

ValueMetadata *_s14ModelStructureO18PipelineCodingKeysOMa()
{
  return &_s14ModelStructureO18PipelineCodingKeysON;
}

ValueMetadata *_s14ModelStructureO15EmptyCodingKeysOMa()
{
  return &_s14ModelStructureO15EmptyCodingKeysON;
}

ValueMetadata *_s14ModelStructureO21UnsupportedCodingKeysOMa()
{
  return &_s14ModelStructureO21UnsupportedCodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV9ValueTypeVMa()
{
  return &_s14ModelStructureO7ProgramV9ValueTypeVN;
}

ValueMetadata *_s4CostVMa()
{
  return &_s4CostVN;
}

ValueMetadata *_s14ModelStructureO7ProgramV5ValueVMa()
{
  return &_s14ModelStructureO7ProgramV5ValueVN;
}

ValueMetadata *_s11DeviceUsageV6ReasonVMa()
{
  return &_s11DeviceUsageV6ReasonVN;
}

uint64_t _s14ModelStructureO8PipelineVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14ModelStructureO8PipelineVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s14ModelStructureO8PipelineVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s14ModelStructureO8PipelineVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s14ModelStructureO8PipelineVMa()
{
  return &_s14ModelStructureO8PipelineVN;
}

unint64_t sub_100029670()
{
  unint64_t result = qword_10003D570;
  if (!qword_10003D570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D570);
  }
  return result;
}

unint64_t sub_1000296C8()
{
  unint64_t result = qword_10003D578;
  if (!qword_10003D578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D578);
  }
  return result;
}

unint64_t sub_100029720()
{
  unint64_t result = qword_10003D580;
  if (!qword_10003D580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D580);
  }
  return result;
}

unint64_t sub_100029778()
{
  unint64_t result = qword_10003D588;
  if (!qword_10003D588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D588);
  }
  return result;
}

unint64_t sub_1000297D0()
{
  unint64_t result = qword_10003D590;
  if (!qword_10003D590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D590);
  }
  return result;
}

unint64_t sub_100029828()
{
  unint64_t result = qword_10003D598;
  if (!qword_10003D598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D598);
  }
  return result;
}

unint64_t sub_100029880()
{
  unint64_t result = qword_10003D5A0;
  if (!qword_10003D5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5A0);
  }
  return result;
}

unint64_t sub_1000298D8()
{
  unint64_t result = qword_10003D5A8;
  if (!qword_10003D5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5A8);
  }
  return result;
}

unint64_t sub_100029930()
{
  unint64_t result = qword_10003D5B0;
  if (!qword_10003D5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5B0);
  }
  return result;
}

unint64_t sub_100029988()
{
  unint64_t result = qword_10003D5B8;
  if (!qword_10003D5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5B8);
  }
  return result;
}

unint64_t sub_1000299E0()
{
  unint64_t result = qword_10003D5C0;
  if (!qword_10003D5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5C0);
  }
  return result;
}

unint64_t sub_100029A38()
{
  unint64_t result = qword_10003D5C8;
  if (!qword_10003D5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5C8);
  }
  return result;
}

unint64_t sub_100029A90()
{
  unint64_t result = qword_10003D5D0;
  if (!qword_10003D5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5D0);
  }
  return result;
}

unint64_t sub_100029AE8()
{
  unint64_t result = qword_10003D5D8;
  if (!qword_10003D5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5D8);
  }
  return result;
}

unint64_t sub_100029B40()
{
  unint64_t result = qword_10003D5E0;
  if (!qword_10003D5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5E0);
  }
  return result;
}

unint64_t sub_100029B98()
{
  unint64_t result = qword_10003D5E8;
  if (!qword_10003D5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5E8);
  }
  return result;
}

unint64_t sub_100029BF0()
{
  unint64_t result = qword_10003D5F0;
  if (!qword_10003D5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5F0);
  }
  return result;
}

unint64_t sub_100029C48()
{
  unint64_t result = qword_10003D5F8;
  if (!qword_10003D5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D5F8);
  }
  return result;
}

unint64_t sub_100029CA0()
{
  unint64_t result = qword_10003D600;
  if (!qword_10003D600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D600);
  }
  return result;
}

unint64_t sub_100029CF8()
{
  unint64_t result = qword_10003D608;
  if (!qword_10003D608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D608);
  }
  return result;
}

unint64_t sub_100029D50()
{
  unint64_t result = qword_10003D610;
  if (!qword_10003D610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D610);
  }
  return result;
}

unint64_t sub_100029DA8()
{
  unint64_t result = qword_10003D618;
  if (!qword_10003D618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D618);
  }
  return result;
}

unint64_t sub_100029E00()
{
  unint64_t result = qword_10003D620;
  if (!qword_10003D620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D620);
  }
  return result;
}

unint64_t sub_100029E58()
{
  unint64_t result = qword_10003D628;
  if (!qword_10003D628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D628);
  }
  return result;
}

unint64_t sub_100029EB0()
{
  unint64_t result = qword_10003D630;
  if (!qword_10003D630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D630);
  }
  return result;
}

unint64_t sub_100029F08()
{
  unint64_t result = qword_10003D638;
  if (!qword_10003D638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D638);
  }
  return result;
}

unint64_t sub_100029F60()
{
  unint64_t result = qword_10003D640;
  if (!qword_10003D640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D640);
  }
  return result;
}

unint64_t sub_100029FB8()
{
  unint64_t result = qword_10003D648;
  if (!qword_10003D648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D648);
  }
  return result;
}

unint64_t sub_10002A010()
{
  unint64_t result = qword_10003D650;
  if (!qword_10003D650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D650);
  }
  return result;
}

unint64_t sub_10002A068()
{
  unint64_t result = qword_10003D658;
  if (!qword_10003D658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D658);
  }
  return result;
}

unint64_t sub_10002A0C0()
{
  unint64_t result = qword_10003D660;
  if (!qword_10003D660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D660);
  }
  return result;
}

unint64_t sub_10002A118()
{
  unint64_t result = qword_10003D668;
  if (!qword_10003D668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D668);
  }
  return result;
}

unint64_t sub_10002A170()
{
  unint64_t result = qword_10003D670;
  if (!qword_10003D670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D670);
  }
  return result;
}

unint64_t sub_10002A1C8()
{
  unint64_t result = qword_10003D678;
  if (!qword_10003D678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D678);
  }
  return result;
}

unint64_t sub_10002A220()
{
  unint64_t result = qword_10003D680;
  if (!qword_10003D680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D680);
  }
  return result;
}

unint64_t sub_10002A278()
{
  unint64_t result = qword_10003D688;
  if (!qword_10003D688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D688);
  }
  return result;
}

unint64_t sub_10002A2D0()
{
  unint64_t result = qword_10003D690;
  if (!qword_10003D690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D690);
  }
  return result;
}

unint64_t sub_10002A328()
{
  unint64_t result = qword_10003D698;
  if (!qword_10003D698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D698);
  }
  return result;
}

unint64_t sub_10002A380()
{
  unint64_t result = qword_10003D6A0;
  if (!qword_10003D6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6A0);
  }
  return result;
}

unint64_t sub_10002A3D8()
{
  unint64_t result = qword_10003D6A8;
  if (!qword_10003D6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6A8);
  }
  return result;
}

unint64_t sub_10002A430()
{
  unint64_t result = qword_10003D6B0;
  if (!qword_10003D6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6B0);
  }
  return result;
}

unint64_t sub_10002A488()
{
  unint64_t result = qword_10003D6B8;
  if (!qword_10003D6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6B8);
  }
  return result;
}

unint64_t sub_10002A4E0()
{
  unint64_t result = qword_10003D6C0;
  if (!qword_10003D6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6C0);
  }
  return result;
}

unint64_t sub_10002A538()
{
  unint64_t result = qword_10003D6C8;
  if (!qword_10003D6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6C8);
  }
  return result;
}

unint64_t sub_10002A590()
{
  unint64_t result = qword_10003D6D0;
  if (!qword_10003D6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6D0);
  }
  return result;
}

unint64_t sub_10002A5E8()
{
  unint64_t result = qword_10003D6D8;
  if (!qword_10003D6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6D8);
  }
  return result;
}

unint64_t sub_10002A640()
{
  unint64_t result = qword_10003D6E0;
  if (!qword_10003D6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6E0);
  }
  return result;
}

unint64_t sub_10002A698()
{
  unint64_t result = qword_10003D6E8;
  if (!qword_10003D6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6E8);
  }
  return result;
}

unint64_t sub_10002A6F0()
{
  unint64_t result = qword_10003D6F0;
  if (!qword_10003D6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6F0);
  }
  return result;
}

unint64_t sub_10002A748()
{
  unint64_t result = qword_10003D6F8;
  if (!qword_10003D6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D6F8);
  }
  return result;
}

unint64_t sub_10002A7A0()
{
  unint64_t result = qword_10003D700;
  if (!qword_10003D700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D700);
  }
  return result;
}

unint64_t sub_10002A7F8()
{
  unint64_t result = qword_10003D708;
  if (!qword_10003D708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D708);
  }
  return result;
}

unint64_t sub_10002A850()
{
  unint64_t result = qword_10003D710;
  if (!qword_10003D710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D710);
  }
  return result;
}

unint64_t sub_10002A8A8()
{
  unint64_t result = qword_10003D718;
  if (!qword_10003D718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D718);
  }
  return result;
}

unint64_t sub_10002A900()
{
  unint64_t result = qword_10003D720;
  if (!qword_10003D720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D720);
  }
  return result;
}

unint64_t sub_10002A958()
{
  unint64_t result = qword_10003D728;
  if (!qword_10003D728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D728);
  }
  return result;
}

unint64_t sub_10002A9B0()
{
  unint64_t result = qword_10003D730;
  if (!qword_10003D730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D730);
  }
  return result;
}

unint64_t sub_10002AA08()
{
  unint64_t result = qword_10003D738;
  if (!qword_10003D738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D738);
  }
  return result;
}

unint64_t sub_10002AA60()
{
  unint64_t result = qword_10003D740;
  if (!qword_10003D740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D740);
  }
  return result;
}

unint64_t sub_10002AAB8()
{
  unint64_t result = qword_10003D748;
  if (!qword_10003D748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D748);
  }
  return result;
}

unint64_t sub_10002AB0C()
{
  unint64_t result = qword_10003D758;
  if (!qword_10003D758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D758);
  }
  return result;
}

unint64_t sub_10002AB60()
{
  unint64_t result = qword_10003D778;
  if (!qword_10003D778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D778);
  }
  return result;
}

unint64_t sub_10002ABB4()
{
  unint64_t result = qword_10003D788;
  if (!qword_10003D788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D788);
  }
  return result;
}

unint64_t sub_10002AC08()
{
  unint64_t result = qword_10003D7A0;
  if (!qword_10003D7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7A0);
  }
  return result;
}

unint64_t sub_10002AC5C()
{
  unint64_t result = qword_10003D7B0;
  if (!qword_10003D7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7B0);
  }
  return result;
}

uint64_t sub_10002ACB0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D30(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002AD1C()
{
  unint64_t result = qword_10003D7D0;
  if (!qword_10003D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7D0);
  }
  return result;
}

ValueMetadata *_s11DeviceUsageV6ReasonV10CodingKeysOMa()
{
  return &_s11DeviceUsageV6ReasonV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV5ValueV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV5ValueV10CodingKeysON;
}

unsigned char *_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002AE2CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s4CostV10CodingKeysOMa()
{
  return &_s4CostV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON;
}

unsigned char *_s11DeviceUsageV12SupportStateO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002AF40);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14ModelStructureO8PipelineV10CodingKeysOMa()
{
  return &_s14ModelStructureO8PipelineV10CodingKeysON;
}

unint64_t sub_10002AF7C()
{
  unint64_t result = qword_10003D7D8;
  if (!qword_10003D7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7D8);
  }
  return result;
}

unint64_t sub_10002AFD4()
{
  unint64_t result = qword_10003D7E0;
  if (!qword_10003D7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7E0);
  }
  return result;
}

unint64_t sub_10002B02C()
{
  unint64_t result = qword_10003D7E8;
  if (!qword_10003D7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7E8);
  }
  return result;
}

unint64_t sub_10002B084()
{
  unint64_t result = qword_10003D7F0;
  if (!qword_10003D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7F0);
  }
  return result;
}

unint64_t sub_10002B0DC()
{
  unint64_t result = qword_10003D7F8;
  if (!qword_10003D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D7F8);
  }
  return result;
}

unint64_t sub_10002B134()
{
  unint64_t result = qword_10003D800;
  if (!qword_10003D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D800);
  }
  return result;
}

unint64_t sub_10002B18C()
{
  unint64_t result = qword_10003D808;
  if (!qword_10003D808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D808);
  }
  return result;
}

unint64_t sub_10002B1E4()
{
  unint64_t result = qword_10003D810;
  if (!qword_10003D810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D810);
  }
  return result;
}

unint64_t sub_10002B23C()
{
  unint64_t result = qword_10003D818;
  if (!qword_10003D818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D818);
  }
  return result;
}

unint64_t sub_10002B294()
{
  unint64_t result = qword_10003D820;
  if (!qword_10003D820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D820);
  }
  return result;
}

unint64_t sub_10002B2EC()
{
  unint64_t result = qword_10003D828;
  if (!qword_10003D828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D828);
  }
  return result;
}

unint64_t sub_10002B344()
{
  unint64_t result = qword_10003D830;
  if (!qword_10003D830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D830);
  }
  return result;
}

unint64_t sub_10002B39C()
{
  unint64_t result = qword_10003D838;
  if (!qword_10003D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D838);
  }
  return result;
}

uint64_t sub_10002B3F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746867696577 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10002C900();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10002B470()
{
  return 0x746867696577;
}

uint64_t sub_10002B4A4@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v1 = sub_10002C030();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)v17 - v6;
  id v8 = [self defaultManager];
  id v9 = [v8 temporaryDirectory];

  sub_10002C010();
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  sub_100008BE0(&qword_10003CA28);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10002D3D0;
  uint64_t v11 = sub_10002C020();
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_10000A8CC();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  if (sub_10002C020() == 0x706D742F7261762FLL && v14 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_10002BFE0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v5, v1);
    goto LABEL_8;
  }
  char v15 = sub_10002C900();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_7;
  }
LABEL_8:
  sub_10002C000();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

uint64_t sub_10002B8DC()
{
  uint64_t v0 = sub_10002C030();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v13 - v5;
  sub_10002B4A4((uint64_t)&v13 - v5);
  sub_10002C040();
  sub_10002C000();
  swift_bridgeObjectRelease();
  sub_10002C4D0();
  v14._countAndFlagsBits = 0x616B6361706C6D2ELL;
  v14._object = (void *)0xEA00000000006567;
  sub_10002C520(v14);
  swift_bridgeObjectRelease();
  sub_10002C000();
  sub_10002C5F0();
  if (qword_10003C908 != -1) {
    swift_once();
  }
  sub_100008BE0(&qword_10003CA28);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10002D3D0;
  uint64_t v8 = sub_10002C020();
  uint64_t v10 = v9;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_10000A8CC();
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  sub_10002C0A0();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v1 + 8);
  v11(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v11)(v6, v0);
}

id sub_10002BB74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelLocation();
  return [super dealloc];
}

uint64_t sub_10002BC30()
{
  return type metadata accessor for ModelLocation();
}

uint64_t type metadata accessor for ModelLocation()
{
  uint64_t result = qword_10003D868;
  if (!qword_10003D868) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002BC84()
{
  uint64_t result = sub_10002C060();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10002BD1C(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CoreML: (XPC) event handler XPC_TYPE_ERROR", v1, 2u);
}

void sub_10002BD60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BDD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BE48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BEC0(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CoreML: (XPC) unknown command - was not 'profile'", v1, 2u);
}

void sub_10002BF04()
{
  __assert_rtn("coreml_event_handler_block_invoke", "main.m", 169, "type == XPC_TYPE_DICTIONARY");
}

uint64_t sub_10002BF30()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10002BF40()
{
  return JSONEncoder.init()();
}

uint64_t sub_10002BF50()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_10002BF60()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t sub_10002BF70()
{
  return URLResourceValues.isRegularFile.getter();
}

uint64_t sub_10002BF80()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_10002BF90()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10002BFA0()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_10002BFB0()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_10002BFC0()
{
  return URL.pathComponents.getter();
}

uint64_t sub_10002BFD0()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_10002BFE0()
{
  return URL.init(fileURLWithPath:)();
}

void sub_10002BFF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10002C000()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10002C010()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002C020()
{
  return URL.path.getter();
}

uint64_t sub_10002C030()
{
  return type metadata accessor for URL();
}

uint64_t sub_10002C040()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10002C050()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002C060()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10002C070()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10002C080()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10002C090()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10002C0A0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10002C0B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10002C0C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10002C0D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10002C0E0()
{
  return type metadata accessor for MLComputePlan.DeviceUsage.SupportState();
}

uint64_t sub_10002C0F0()
{
  return MLComputePlan.DeviceUsage.supportState(for:)();
}

uint64_t sub_10002C100()
{
  return MLComputePlan.DeviceUsage.Reason.Category.rawValue.getter();
}

uint64_t sub_10002C110()
{
  return type metadata accessor for MLComputePlan.DeviceUsage.Reason.Category();
}

uint64_t sub_10002C120()
{
  return MLComputePlan.DeviceUsage.Reason.category.getter();
}

uint64_t sub_10002C130()
{
  return type metadata accessor for MLComputePlan.DeviceUsage.Reason();
}

uint64_t sub_10002C140()
{
  return MLComputePlan.DeviceUsage.preferred.getter();
}

uint64_t sub_10002C150()
{
  return MLComputePlan.DeviceUsage.supported.getter();
}

uint64_t sub_10002C160()
{
  return type metadata accessor for MLComputePlan.DeviceUsage();
}

uint64_t sub_10002C170()
{
  return dispatch thunk of MLComputePlan.deviceUsage(for:)();
}

uint64_t sub_10002C180()
{
  return dispatch thunk of MLComputePlan.deviceUsage(for:)();
}

uint64_t sub_10002C190()
{
  return dispatch thunk of MLComputePlan.estimatedCost(of:)();
}

uint64_t sub_10002C1A0()
{
  return MLComputePlan.modelStructure.getter();
}

uint64_t sub_10002C1B0()
{
  return MLComputePlan.Cost.weight.getter();
}

uint64_t sub_10002C1C0()
{
  return type metadata accessor for MLComputePlan.Cost();
}

uint64_t sub_10002C1E0()
{
  return type metadata accessor for MLComputePlan();
}

uint64_t sub_10002C1F0()
{
  return MLShapedArray.init<A>(scalars:shape:)();
}

uint64_t sub_10002C200()
{
  return static MLComputeDevice.allComputeDevices.getter();
}

uint64_t sub_10002C210()
{
  return type metadata accessor for MLComputeDevice();
}

uint64_t sub_10002C220()
{
  return MLModelStructure.NeuralNetwork.Layer.inputNames.getter();
}

uint64_t sub_10002C230()
{
  return MLModelStructure.NeuralNetwork.Layer.outputNames.getter();
}

uint64_t sub_10002C240()
{
  return MLModelStructure.NeuralNetwork.Layer.name.getter();
}

uint64_t sub_10002C250()
{
  return MLModelStructure.NeuralNetwork.Layer.type.getter();
}

uint64_t sub_10002C260()
{
  return type metadata accessor for MLModelStructure.NeuralNetwork.Layer();
}

uint64_t sub_10002C270()
{
  return MLModelStructure.NeuralNetwork.layers.getter();
}

uint64_t sub_10002C280()
{
  return type metadata accessor for MLModelStructure.NeuralNetwork();
}

uint64_t sub_10002C290()
{
  return MLModelStructure.Program.NamedValueType.name.getter();
}

uint64_t sub_10002C2A0()
{
  return MLModelStructure.Program.NamedValueType.type.getter();
}

uint64_t sub_10002C2B0()
{
  return type metadata accessor for MLModelStructure.Program.NamedValueType();
}

uint64_t sub_10002C2C0()
{
  return MLModelStructure.Program.Block.operations.getter();
}

uint64_t sub_10002C2D0()
{
  return MLModelStructure.Program.Block.outputNames.getter();
}

uint64_t sub_10002C2E0()
{
  return MLModelStructure.Program.Block.inputs.getter();
}

uint64_t sub_10002C2F0()
{
  return type metadata accessor for MLModelStructure.Program.Block();
}

uint64_t sub_10002C300()
{
  return type metadata accessor for MLModelStructure.Program.Binding();
}

uint64_t sub_10002C310()
{
  return MLModelStructure.Program.Argument.bindings.getter();
}

uint64_t sub_10002C320()
{
  return type metadata accessor for MLModelStructure.Program.Argument();
}

uint64_t sub_10002C330()
{
  return MLModelStructure.Program.Function.block.getter();
}

uint64_t sub_10002C340()
{
  return MLModelStructure.Program.Function.inputs.getter();
}

uint64_t sub_10002C350()
{
  return type metadata accessor for MLModelStructure.Program.Function();
}

uint64_t sub_10002C360()
{
  return MLModelStructure.Program.Operation.operatorName.getter();
}

uint64_t sub_10002C370()
{
  return MLModelStructure.Program.Operation.blocks.getter();
}

uint64_t sub_10002C380()
{
  return MLModelStructure.Program.Operation.inputs.getter();
}

uint64_t sub_10002C390()
{
  return MLModelStructure.Program.Operation.outputs.getter();
}

uint64_t sub_10002C3A0()
{
  return type metadata accessor for MLModelStructure.Program.Operation();
}

uint64_t sub_10002C3B0()
{
  return type metadata accessor for MLModelStructure.Program.ValueType();
}

uint64_t sub_10002C3C0()
{
  return MLModelStructure.Program.functions.getter();
}

uint64_t sub_10002C3D0()
{
  return type metadata accessor for MLModelStructure.Program();
}

uint64_t sub_10002C3E0()
{
  return MLModelStructure.Pipeline.subModelNames.getter();
}

uint64_t sub_10002C3F0()
{
  return MLModelStructure.Pipeline.subModels.getter();
}

uint64_t sub_10002C400()
{
  return type metadata accessor for MLModelStructure.Pipeline();
}

uint64_t sub_10002C410()
{
  return type metadata accessor for MLModelStructure();
}

uint64_t sub_10002C420()
{
  return noErr.getter();
}

NSDictionary sub_10002C430()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10002C440()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10002C450()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10002C460()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10002C470()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10002C480()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002C490()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10002C4A0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_10002C4B0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10002C4C0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10002C4D0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_10002C4E0()
{
  return String.hash(into:)();
}

uint64_t sub_10002C4F0()
{
  return String.count.getter();
}

uint64_t sub_10002C500()
{
  return String.index(_:offsetBy:)();
}

void sub_10002C510(Swift::String a1)
{
}

BOOL sub_10002C520(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_10002C530()
{
  return String.subscript.getter();
}

uint64_t sub_10002C540()
{
  return String.init<A>(_:)();
}

NSArray sub_10002C550()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10002C560()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002C570()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10002C580()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10002C590()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10002C5A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10002C5B0()
{
  return MLMultiArray.init<A>(_:)();
}

uint64_t sub_10002C5C0()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_10002C5D0()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t sub_10002C5E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10002C5F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10002C600()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10002C610()
{
  return static MLModel.availableComputeDevices.getter();
}

uint64_t sub_10002C620()
{
  return MLModel.makeState()();
}

NSNumber sub_10002C630(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

uint64_t sub_10002C640()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10002C650()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10002C660()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_10002C670(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10002C680()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10002C690()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10002C6A0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10002C6B0(Swift::Int a1)
{
}

uint64_t sub_10002C6C0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10002C6D0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10002C6E0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10002C6F0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10002C700()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10002C710()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10002C720()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10002C730()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10002C740()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002C750()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002C760()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10002C770()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10002C780()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10002C790()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10002C7A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10002C7C0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10002C7D0()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10002C7E0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10002C7F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002C800()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002C810()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002C820()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10002C830()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10002C840()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10002C850()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10002C860()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10002C870()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10002C880()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002C890()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002C8A0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002C8B0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10002C8C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_10002C8D0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10002C8E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10002C8F0()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_10002C900()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10002C910()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10002C920()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10002C930()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10002C940()
{
  return Error._code.getter();
}

uint64_t sub_10002C950()
{
  return Error._domain.getter();
}

uint64_t sub_10002C960()
{
  return Error._userInfo.getter();
}

uint64_t sub_10002C970()
{
  return Hasher.init(_seed:)();
}

void sub_10002C980(Swift::UInt a1)
{
}

Swift::Int sub_10002C990()
{
  return Hasher._finalize()();
}

uint64_t sub_10002C9A0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10002C9B0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return _VTPixelTransferSessionCreate(allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return _VTPixelTransferSessionTransferImage(session, sourceBuffer, destinationBuffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

[a1 a2, ...];
{
  return _[a1 a2];
}

[super a2];
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return _vImageConvert_PlanarFtoPlanar16F(src, dest, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

[objc_msgSend_UTF8String:a1 UTF8String:a2];
{
  return _[a1 UTF8String];
}

[objc_msgSend_initWithConfig_ initWithConfig:];
{
  return [a1 initWithConfig:];
}

[objc_msgSend_initWithExperimentIterations_loadCount_predictionCount_maxPredictionTime_maxIterationTime_functionName_ initWithExperimentIterations:loadCount:predictionCount:maxPredictionTime:maxIterationTime:functionName:];
{
  return [a1 initWithExperimentIterations:loadCount:predictionCount:maxPredictionTime:maxIterationTime:functionName:];
}

[objc_msgSend_initWithTempFolderGuid_fileName_ initWithTempFolderGuid:a2 fileName:a3];
{
  return [a1 initWithTempFolderGuid:fileName:];
}

[NSUUID initWithUUIDString:a2];
{
  return [a1 initWithUUIDString];
}

[objc_msgSend_runWithModelLocation_computeUnits_perfRunConfig_completionHandler_ runWithModelLocation:a2 computeUnits:a3 perfRunConfig:a4 completionHandler:a5];
{
  return [a1 runWithModelLocation:computeUnits:perfRunConfig:completionHandler:];
}

[NSString stringWithFormat:a2, ...];
{
  return [a1 stringWithFormat:];
}