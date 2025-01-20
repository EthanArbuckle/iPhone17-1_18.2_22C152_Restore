int main(int argc, const char **argv, const char **envp)
{
  sub_100003998();
  sub_100003938();
  sub_100003988();
  return 0;
}

unint64_t sub_100003938()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    sub_100003998();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003988()
{
  return static Daemon.main()();
}

uint64_t sub_100003998()
{
  return type metadata accessor for IntelligenceFlowDaemon();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}