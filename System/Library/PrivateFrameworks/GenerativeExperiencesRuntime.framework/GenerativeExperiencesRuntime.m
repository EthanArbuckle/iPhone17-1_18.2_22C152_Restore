int main(int argc, const char **argv, const char **envp)
{
  sub_100003C6C();
  sub_100003C0C();
  sub_100003C5C();
  return 0;
}

unint64_t sub_100003C0C()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    sub_100003C6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003C5C()
{
  return static Daemon.main()();
}

uint64_t sub_100003C6C()
{
  return type metadata accessor for GenerativeExperiencesDaemon();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}